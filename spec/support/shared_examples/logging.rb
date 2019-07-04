# Expects:
# let(:message) - the message to be logged
RSpec.shared_context 'logs the message' do
  let(:debug_double) { double.as_null_object }

  before do
    allow(Rails.logger).to receive(:debug).and_return debug_double
  end

  it 'to the rails log' do
    expect(Rails.logger).to receive(:debug).with(/#{message}/)
    execute
  end
end

# Expects:
# let(:message) - the message to be logged
# @param policy_or_name [String, Class] the policy, or its name,
#    which should be logged.
RSpec.shared_context 'logs policy name' do |policy_or_name|
  let(:message) do
    if policy_or_name.is_a?(String)
      policy_or_name
    else
      policy_or_name.name
    end
  end

  include_context 'logs the message'
end

# Expects:
# let(:message) - the message that shouldn't be logged
RSpec.shared_context 'does not log the message' do
  let(:debug_double) { double.as_null_object }

  before do
    allow(Rails.logger).to receive(:debug).and_return debug_double
  end

  it 'to the rails log' do
    expect(Rails.logger).to_not receive(:debug).with(/#{message}/)
    execute
  end
end

# Expects:
# let(:message) - the message that shouldn't be logged
# @param policy_or_name [String, Class] the policy, or its name,
#    which should be logged.
RSpec.shared_context 'does not log policy name' do |policy_or_name|
  let(:message) do
    if policy_or_name.is_a?(String)
      policy_or_name
    else
      policy_or_name.name
    end
  end

  include_context 'does not log the message'
end

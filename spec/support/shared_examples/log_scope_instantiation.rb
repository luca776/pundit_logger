RSpec.shared_examples 'LogScopeInstantiation occurs' do
  let(:message) do
    "Invoking WidgetPolicy::Scope"
  end

  it_behaves_like 'logs the message'

  context 'LogControllerPolicySummary configuration is false' do
    before { configure :log_scope_instantiation, false }
    it_behaves_like 'does not log the message'
  end
end

RSpec.shared_examples 'LogScopeInstantiation does not occur' do
  let(:message) do
    "Invoking WidgetPolicy::Scope"
  end

  it_behaves_like 'does not log the message'
end
RSpec.shared_examples 'LogUnauthorizedPolicies' do
  let(:message) do
    "Authorization Failed for WidgetPolicy:.*#{widget.product_id}"
  end

  context 'user is authorized' do
    it_behaves_like 'does not log the message'
  end

  context 'user is not authorized' do
    let(:user) { unauthorized_user }
    it_behaves_like 'logs the message'

    context 'LogUnauthorizedPolicies configuration is false' do
      before { configure :log_unauthorized_policies, false }
      it_behaves_like 'does not log the message'
    end
  end
end
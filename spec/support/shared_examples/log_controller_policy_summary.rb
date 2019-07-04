RSpec.shared_examples 'LogControllerPolicySummary' do
  let(:message) do
    'Controller Action Policies Invoked: WidgetPolicy::Scope'
  end
  it_behaves_like 'logs the message'

  context 'LogControllerPolicySummary configuration is false' do
    before { configure :log_controller_policy_summary, false }
    it_behaves_like 'does not log the message'
  end

  context 'pundit scope' do
    it 'still works' do
      execute
      expect(response.body).to include(widget.product_id)
    end
  end
end

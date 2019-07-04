require 'spec_helper'

RSpec.describe WidgetsController, type: :controller do
  let(:user) { double(first_name: 'Peter', last_name: 'Griffin') }
  let(:unauthorized_user) { double(first_name: 'Stewie', last_name: 'Griffin') }
  let(:widget) { @widget }

  before do
    allow_any_instance_of(WidgetsController)
      .to receive(:current_user)
      .and_return user
  end

  before(:all) { @widget = Widget.create(product_id: 'Lorem Ipsum') }
  after(:all)  { @widget.destroy }

  describe 'Controller Logging' do
    context 'index' do
      # This controller action uses a scope, but does not
      # have authorization
      let(:execute) { get :index }
      it_behaves_like 'LogControllerPolicySummary'
      it_behaves_like 'LogScopeInstantiation occurs'
    end

    context 'show' do
      # This controller action does not use a scope, but does
      # have authorization
      let(:execute) { get :show, params: { id: widget.id } }
      it_behaves_like 'LogUnauthorizedPolicies'
      it_behaves_like 'LogScopeInstantiation does not occur'
    end
  end
end

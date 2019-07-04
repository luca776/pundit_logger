require 'spec_helper'

RSpec.describe PunditLogger do
  describe :gem_configuration do
    it 'has a version number' do
      expect(PunditLogger::VERSION).not_to be nil
    end
  end
end

RSpec.describe 'Rails Dummy App Setup' do
  it { expect(Widget.is_a?(Class)).to eq true }
  it { expect(Widget.column_names).to include('product_id') }
end

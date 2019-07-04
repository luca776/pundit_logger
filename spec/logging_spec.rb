require 'spec_helper'

RSpec.describe Pundit::Logger::Logging do
  describe '#log' do
    let(:logger) { Rails.logger }
    let(:message) { 'Generic log message' }
    let(:execute) { Pundit::Logger.log(message) }

    # Expects:
    # let(:logger_tag)  Name of the tag expected
    # let(:message)     Message to log
    shared_examples 'tagged logging is set' do
      subject { logger }
      after { execute }
      it { is_expected.to receive(:tagged).with(logger_tag).once }
    end

    # Expects:
    # let(:message)     Message to log
    shared_examples 'tagged logging is not set' do
      subject { logger }
      after { execute }
      it { } #just works, ok!
    end

    context 'logger uses tagged logging' do
      context 'default configuration' do
        let(:logger_tag) { 'PUNDIT' }

        it_behaves_like 'tagged logging is set'
        it_behaves_like 'logs the message'
      end

      context 'custom configuration' do
        let(:logger_tag) { 'CUSTOM TAG' }
        before { configure :logger_tag, logger_tag }
        it_behaves_like 'tagged logging is set'
        it_behaves_like 'logs the message'
      end

      context 'nil logger_tag configured' do
        before { configure :logger_tag, nil }
        it_behaves_like 'tagged logging is not set'
        it_behaves_like 'logs the message'
      end

      context 'false logger_tag configured' do
        before { configure :logger_tag, false }
        it_behaves_like 'tagged logging is not set'
        it_behaves_like 'logs the message'
      end
    end

    context 'logger does not use tagged logging' do
      let(:logger) { double }
      before do
        allow(Rails).to receive(:logger).and_return(logger)
        allow(logger).to receive(:debug).and_return(true)
        expect(logger).to_not respond_to(:tagged)
      end
      it_behaves_like 'tagged logging is not set'

      it 'logs the message to the logger' do
        expect(logger).to receive(:debug).with(/#{message}/)
        execute
      end
    end

    context 'log_level configuration' do
      subject { logger }
      after { execute }

      context 'default' do
        it { is_expected.to receive(:debug).with(message).once }
      end

      context 'custom' do
        let(:custom_level) { :warn }
        before { configure :log_level, custom_level }
        it { is_expected.to receive(custom_level).with(message).once }
      end
    end

    context 'custom logger' do
      let(:logger) { double }

      before do
        configure :logger, logger
        allow(logger).to receive(:debug).and_return(true)
      end

      it_behaves_like 'tagged logging is not set'

      it 'does not use the default logger' do
        expect(Rails).to_not receive(:logger)
        execute
      end

      it 'logs the message to the logger' do
        expect(logger).to receive(:debug).with(/#{message}/)
        execute
      end
    end
  end
end

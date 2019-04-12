require 'spec_helper'

describe 'hiera5rspec' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'loading from module only' do
        it { is_expected.to contain_notify('This message came from the module layer') }
        it { is_expected.to contain_notify('This message also came from the module layer') }
        it { is_expected.not_to contain_notify('This is invalid and will never load') }
        it { is_expected.to contain_notify('This is the default value for message3') }
      end

      context 'loading from global layer' do
        let(:hiera_config) { 'spec/fixtures/hiera.yaml' }

        it { is_expected.to contain_notify('This message came from the global layer') }
        it { is_expected.to contain_notify('This message also came from the global layer') }
        it { is_expected.not_to contain_notify('This is invalid and will never load') }
        it { is_expected.to contain_notify('This message is valid and will load') }
      end
    end
  end
end

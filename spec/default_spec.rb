require 'spec_helper'

describe 'firefox::default' do
  context 'determine latest version' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'windows', version: '2008R2') do
        allow_any_instance_of(Chef::Recipe).to receive(:firefox_package) { 'Firefox%20Setup%2032.0.3.exe' }
      end.converge(described_recipe)
    end

    it 'installs latest version' do
      expect(chef_run).to install_windows_package('Mozilla Firefox 32.0.3 en-US').with(
        source: 'https://download-installer.cdn.mozilla.net/pub/firefox/releases/latest/win32/en-US'\
          '/Firefox%20Setup%2032.0.3.exe',
        installer_type: :custom,
        options: '-ms'
      )
    end
  end

  context 'override default version and lang' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'windows', version: '2008R2') do |node|
        node.set['firefox']['version'] = '29.0.1'
        node.set['firefox']['lang'] = 'fr'
      end.converge(described_recipe)
    end

    it 'installs specific version and lang' do
      expect(chef_run).to install_windows_package('Mozilla Firefox 29.0.1 fr').with(
        source: 'https://download-installer.cdn.mozilla.net/pub/firefox/releases/29.0.1/win32/fr'\
          '/Firefox%20Setup%2029.0.1.exe',
        installer_type: :custom,
        options: '-ms'
      )
    end
  end
end

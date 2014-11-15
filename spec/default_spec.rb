require 'spec_helper'

describe 'firefox_test::default' do
  context 'windows install of latest version' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'windows', version: '2008R2') do
        allow_any_instance_of(Chef::Recipe).to receive(:firefox_latest) { 'Firefox%20Setup%2032.0.3.exe' }
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

  context 'mac install of latest version' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'mac_os_x', version: '10.7.4') do
        allow_any_instance_of(Chef::Recipe).to receive(:firefox_latest) { 'Firefox%2032.0.3.dmg' }
      end.converge(described_recipe)
    end

    it 'installs latest version' do
      expect(chef_run).to install_dmg_package('Mozilla Firefox').with(
        source: 'https://download-installer.cdn.mozilla.net/pub/firefox/releases/latest/mac/en-US/Firefox%2032.0.3.dmg',
        dmg_name: 'firefox'
      )
    end
  end

  # context 'linux install of latest version' do
  #   let(:chef_run) do
  #     ChefSpec::Runner.new do |node|
  #       node.set['firefox']['use_package_manager'] = false
  #       allow_any_instance_of(Chef::Recipe).to receive(:firefox_latest) { 'firefox-32.0.3.tar.bz2' }
  #     end.converge(described_recipe)
  #   end
  #
  #   it 'installs latest version' do
  #     expect(chef_run).to install_ark('Mozilla Firefox').with(
  #       url: 'https://download-installer.cdn.mozilla.net/pub/firefox/releases/latest/linux-x86_64/en-US/'\
  #         'firefox-32.0.3.tar.bz2',
  #       version: '32.0.3',
  #       extension: 'tar.bz2',
  #       has_binaries: ['firefox']
  #     )
  #   end
  # end

  context 'linux install of latest version using package manager' do
    let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

    it 'installs latest version' do
      expect(chef_run).to install_package('firefox').with(
        version: nil
      )
    end
  end

  context 'linux install of specific version using package manager' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set['firefox']['version'] = '28.0+build2-0ubuntu2'
      end.converge(described_recipe)
    end

    it 'installs latest version' do
      expect(chef_run).to install_package('firefox').with(
        version: '28.0+build2-0ubuntu2'
      )
    end
  end
end

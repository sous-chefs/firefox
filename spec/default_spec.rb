require 'spec_helper'

describe 'firefox_test::default' do
  context 'windows install of latest version' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'windows', version: '2019') do
        allow_any_instance_of(Chef::Recipe).to receive(:ff_download_url) { 'Firefox%20Setup%2032.0.3.exe' }
      end.converge(described_recipe)
    end

    it 'installs latest version' do
      expect(chef_run).to install_windows_package('Mozilla Firefox 65.0.0 (x86 en-US)').with(
        source: 'https://download-installer.cdn.mozilla.net/pub/firefox/releases/65.0/win32/en-US/Firefox%20Setup%2065.0.exe',
        installer_type: :custom,
        options: '-ms'
      )
    end
  end

  context 'override default version and lang' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'windows', version: '2012R2') do |node|
        node.normal['firefox']['version'] = '29.0.1'
        node.normal['firefox']['lang'] = 'fr'
      end.converge(described_recipe)
    end

    it 'installs specific version and lang' do
      expect(chef_run).to install_windows_package('Mozilla Firefox 29.0.1 (x86 fr)').with(
        source: 'https://download-installer.cdn.mozilla.net/pub/firefox/releases/29.0.1/win32/fr/Firefox%20Setup%2029.0.1.exe',
        installer_type: :custom,
        options: '-ms'
      )
    end
  end

  context 'mac install of latest version' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.12') do
        allow_any_instance_of(Chef::Recipe).to receive(:ff_download_url) { 'Firefox%2032.0.3.dmg' }
      end.converge(described_recipe)
    end

    it 'installs latest version' do
      expect(chef_run).to install_dmg_package('Firefox').with(
        source: 'https://download-installer.cdn.mozilla.net/pub/firefox/releases/65.0/mac/en-US/Firefox%2065.0.dmg',
        dmg_name: 'firefox'
      )
    end
  end

  context 'linux install of latest version using package manager' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe)
    end

    it 'installs latest version' do
      expect(chef_run).to install_package('firefox').with(
        version: nil
      )
    end

    it 'updates package manager' do
      expect(chef_run).to_not run_execute('apt-get update')
    end
  end

  context 'linux install of specific version using package manager' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04') do |node|
        node.normal['firefox']['version'] = '28.0+build2-0ubuntu2'
      end.converge(described_recipe)
    end

    it 'installs latest version' do
      expect(chef_run).to install_package('firefox').with(
        version: '28.0+build2-0ubuntu2'
      )
    end
  end

  context 'linux upgrade using package manager' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04') do |node|
        node.normal['firefox']['install_action'] = :upgrade
      end.converge(described_recipe)
    end

    it 'upgrades to the latest version' do
      expect(chef_run).to upgrade_package('firefox')
    end
  end
end

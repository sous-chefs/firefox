require 'spec_helper'

describe 'firefox_install on Ubuntu' do
  step_into :firefox_install

  context 'with default settings on Ubuntu' do
    platform 'ubuntu'

    recipe do
      firefox_install 'install firefox'
    end

    it { is_expected.to install_package('firefox') }
  end

  context 'with version specified on Ubuntu' do
    platform 'ubuntu'

    recipe do
      firefox_install 'install firefox' do
        version '45.0'
      end
    end

    it { is_expected.to install_package('firefox').with(version: '45.0') }
  end

  context 'with upgrade action specified on Ubuntu' do
    platform 'ubuntu'

    recipe do
      firefox_install 'install firefox' do
        version '45.0'
        action :upgrade
      end
    end

    it { is_expected.to upgrade_package('firefox').with(version: '45.0') }
  end

  context 'with default settings on macOS' do
    platform 'mac_os_x'

    recipe do
      firefox_install 'install firefox'
    end

    it { is_expected.to install_dmg_package('Firefox') }
  end

  context 'with vesion specified on Windows' do
    platform 'windows'

    recipe do
      firefox_install 'install firefox' do
        lang 'fr'
        version '45.0'
      end
    end

    it {
      is_expected.to install_windows_package('Mozilla Firefox 45.0 (x86_64 fr)').with(
        source: 'https://download-installer.cdn.mozilla.net/pub/firefox/releases/45.0/win64/fr/Firefox%20Setup%2045.0.exe',
        installer_type: :custom,
        options: '-ms'
      )
    }
  end
end

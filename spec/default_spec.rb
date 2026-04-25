# frozen_string_literal: true

require 'spec_helper'

describe 'firefox_install' do
  step_into :firefox_install

  context 'with default settings on Ubuntu' do
    platform 'ubuntu', '24.04'

    recipe do
      firefox_install 'firefox'
    end

    it { is_expected.to add_apt_repository('mozilla') }
    it { is_expected.to create_file('/etc/apt/preferences.d/mozilla') }
    it { is_expected.to nothing_apt_update('mozilla') }
    it { is_expected.to install_package('firefox') }
  end

  context 'with version specified on Ubuntu' do
    platform 'ubuntu', '24.04'

    recipe do
      firefox_install 'firefox' do
        version '140.0.2'
      end
    end

    it { is_expected.to install_package('firefox').with(version: '140.0.2') }
  end

  context 'with upgrade action specified on Ubuntu' do
    platform 'ubuntu', '24.04'

    recipe do
      firefox_install 'firefox' do
        version '140.0.2'
        action :upgrade
      end
    end

    it { is_expected.to upgrade_package('firefox').with(version: '140.0.2') }
  end

  context 'with Mozilla repository management disabled on Debian' do
    platform 'debian', '12'

    recipe do
      firefox_install 'firefox' do
        manage_repository false
      end
    end

    it { is_expected.to install_package('firefox').with(package_name: 'firefox-esr') }
    it { is_expected.not_to add_apt_repository('mozilla') }
  end

  context 'with default settings on RHEL' do
    platform 'redhat', '9'

    recipe do
      firefox_install 'firefox'
    end

    it { is_expected.not_to create_yum_repository('mozilla') }
    it { is_expected.to install_package('firefox') }
  end

  context 'with default settings on openSUSE' do
    platform 'suse', '15'

    recipe do
      firefox_install 'firefox'
    end

    it { is_expected.not_to add_zypper_repository('mozilla') }
    it { is_expected.to install_package('firefox').with(package_name: 'MozillaFirefox') }
  end

  context 'with default settings on macOS' do
    platform 'mac_os_x', '10.15'

    recipe do
      firefox_install 'firefox'
    end

    it { is_expected.to install_dmg_package('Firefox') }
  end

  context 'with version specified on Windows' do
    platform 'windows', '10'

    recipe do
      firefox_install 'firefox' do
        lang 'fr'
        version '140.0.2'
      end
    end

    it do
      is_expected.to install_windows_package('Mozilla Firefox 140.0.2 (x86_64 fr)').with(
        source: 'https://download.mozilla.org/?product=firefox-140.0.2&os=win64&lang=fr',
        installer_type: :custom,
        options: '-ms'
      )
    end
  end
end

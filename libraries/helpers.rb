# frozen_string_literal: true

module Firefox
  module Cookbook
    module Helpers
      def install_firefox(install_action)
        if platform_family?('windows')
          desired_package_name = ff_windows_package_string
          source_url = ff_download_url

          windows_package desired_package_name do
            source source_url
            installer_type :custom
            options '-ms'
            action install_action
          end
        elsif platform_family?('mac_os_x')
          source_url = ff_download_url

          dmg_package 'Firefox' do
            dmg_name 'firefox'
            source source_url
            action install_action
          end
        elsif node['os'] == 'linux'
          configure_firefox_repository if new_resource.manage_repository

          desired_package_name = new_resource.package_name
          version = new_resource.version

          package 'firefox' do
            package_name desired_package_name
            version version unless version == 'latest'
            action install_action
          end
        else
          raise 'Unsupported platform. If you believe the Firefox cookbook can and should support this platform please open a Pull Request at https://github.com/sous-chefs/firefox'
        end
      end

      def default_firefox_package_name(repository_managed)
        return 'firefox' if repository_managed && platform_family?('debian')

        case node['platform_family']
        when 'suse'
          'MozillaFirefox'
        when 'debian'
          platform?('debian') ? 'firefox-esr' : 'firefox'
        else
          'firefox'
        end
      end

      def configure_firefox_repository
        configure_firefox_apt_repository if platform_family?('debian')
      end

      def configure_firefox_apt_repository
        package %w(ca-certificates gnupg)

        apt_repository 'mozilla' do
          uri 'https://packages.mozilla.org/apt'
          components ['main']
          distribution 'mozilla'
          key 'https://packages.mozilla.org/apt/repo-signing-key.gpg'
        end

        apt_update 'mozilla' do
          action :nothing
        end

        file '/etc/apt/preferences.d/mozilla' do
          content <<~PREFERENCES
            Package: *
            Pin: origin packages.mozilla.org
            Pin-Priority: 1000
          PREFERENCES
          mode '0644'
          notifies :update, 'apt_update[mozilla]', :immediately
        end
      end

      def ff_windows_package_string
        arch = node['kernel']['machine'] == 'x86_64' ? 'x86_64' : 'x86'
        "Mozilla Firefox #{firefox_version} (#{arch} #{new_resource.lang})"
      end

      def firefox_version
        if platform_family?('windows', 'mac_os_x')
          return new_resource.version unless new_resource.version == 'latest'
          ff_download_url.match(/(-|%20)([\d|.]*).(exe|dmg|tar\.bz2)/)[2] # http://rubular.com/r/thFO453EZZ
        else
          cmd = Mixlib::ShellOut.new('firefox --version')
          begin
            cmd.run_command
          rescue Errno::ENOENT # firefox command did not exist
            return if cmd.error?
          end
          cmd.stdout.match(/Mozilla Firefox (.*)/)[1]
        end
      end

      def ff_download_url
        "https://download.mozilla.org/?product=firefox-#{new_resource.version}&os=#{firefox_platform}&lang=#{new_resource.lang}"
      end

      def firefox_platform
        if platform_family?('windows')
          node['kernel']['machine'] == 'x86_64' ? 'win64' : 'win32'
        elsif platform_family?('mac_os_x')
          'osx'
        end
      end
    end
  end
end

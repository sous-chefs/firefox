module Firefox
  module Cookbook
    module Helpers
      def do_firefox_install(install_action)
        if platform_family?('windows')
          windows_package ff_windows_package_string do
            source ff_download_url
            installer_type :custom
            options '-ms'
            action install_action
          end
        elsif platform_family?('mac_os_x')
          dmg_package 'Firefox' do
            dmg_name 'firefox'
            source ff_download_url
            action install_action
          end
        elsif node['os'] == 'linux'
          package 'firefox' do
            package_name new_resource.package_name
            version new_resource.version unless new_resource.version == 'latest'
            action install_action
          end
        else
          raise 'Unsupported platform. If you believe the Firefox cookbook can and should support this platform please open a Pull Request at https://github.com/sous-chefs/firefox'
        end
      end

      def firefox_package_name
        case node['platform_family']
        when 'suse'
          'MozillaFirefox'
        when 'debian'
          platform?('debian') ? 'firefox-esr' : 'firefox'
        else
          'firefox'
        end
      end

      private

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
        require 'net/http'
        require 'uri'
        Net::HTTP.get_response(URI.parse("https://download.mozilla.org/?product=firefox-#{new_resource.version}&os=#{firefox_platform}&lang=#{new_resource.lang}"))['location']
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
Chef::DSL::Recipe.include ::Firefox::Cookbook::Helpers
Chef::Resource.include ::Firefox::Cookbook::Helpers

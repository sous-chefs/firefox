require 'net/http'
require 'uri'

# Firefox helper
module Firefox
  def firefox_version
    if platform_family?('windows', 'mac_os_x')
      return node['firefox']['version'] unless node['firefox']['version'] == 'latest'
      ff_download_url.match(/(-|%20)([\d|.]*).(exe|dmg|tar\.bz2)/)[2] # http://rubular.com/r/thFO453EZZ
    else
      cmd = Mixlib::ShellOut.new('firefox --version')
      begin
        cmd.run_command
      rescue Errno::ENOENT # firefox command did not exist
        return nil if cmd.error?
      end
      cmd.stdout.match(/Mozilla Firefox (.*)/)[1]
    end
  end

  def ff_download_url
    Net::HTTP.get_response(URI.parse("https://download.mozilla.org/?product=firefox-#{node['firefox']['version']}&os=#{firefox_platform}&lang=#{node['firefox']['lang']}"))['location']
  end

  # private

  def firefox_platform
    if platform_family?('windows')
      'win'
    elsif platform_family?('mac_os_x')
      'osx'
    end
  end

  def firefox_package(version)
    if platform?('windows')
      "Firefox%20Setup%20#{version}.exe"
    elsif platform?('mac_os_x')
      "Firefox%20#{version}.dmg"
    end
  end
end

Chef::Provider.send(:include, Firefox)
Chef::Recipe.send(:include, Firefox)
Chef::Resource.send(:include, Firefox)

require 'open-uri'
require 'openssl'

# Firefox helper
module Firefox
  def firefox_base_uri
    "#{node['firefox']['releases_url']}/#{node['firefox']['version']}/#{firefox_platform}/#{node['firefox']['lang']}"
  end

  def firefox_version
    return node['firefox']['version'] unless node['firefox']['version'] == 'latest'
    html = open(firefox_base_uri, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE).read
    html.match(/(-|%20)([\d|.]*).(exe|dmg|tar.bz2)/)[2] # http://rubular.com/r/thFO453EZZ
  end

  def firefox_package(version = nil)
    version ||= firefox_version
    if platform?('windows')
      "Firefox%20Setup%20#{version}.exe"
    elsif platform?('mac_os_x')
      "Firefox%20#{version}.dmg"
    else
      "firefox-#{version}.tar.bz2"
    end
  end

  def firefox_platform
    if platform?('windows')
      'win32'
    elsif platform?('mac_os_x')
      'mac'
    else
      node['kernel']['machine'] == 'x86_64' && !node['firefox']['32bit_only'] ? 'linux-x86_64' : 'linux-i686'
    end
  end
end

Chef::Provider.send(:include, Firefox)
Chef::Recipe.send(:include, Firefox)
Chef::Resource.send(:include, Firefox)

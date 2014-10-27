require 'open-uri'
require 'openssl'

# Firefox helper
module Firefox
  def firefox_base_uri
    "#{node['firefox']['releases_url']}/#{node['firefox']['version']}/win32/#{node['firefox']['lang']}"
  end

  def firefox_version
    firefox_ascertain_version(firefox_executable)
  end

  def firefox_executable
    return "Firefox%20Setup%20#{node['firefox']['version']}.exe" unless node['firefox']['version'] == 'latest'
    html = open(firefox_base_uri, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE).read
    html[/(Firefox%20Setup%20[\d|.]*.exe)/]
    Regexp.last_match[1]
  end

  def firefox_ascertain_version(filename)
    filename[/%20([\d|.]*).exe/]
    Regexp.last_match[1]
  end
end

Chef::Provider.send(:include, Firefox)
Chef::Recipe.send(:include, Firefox)
Chef::Resource.send(:include, Firefox)

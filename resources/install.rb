# Cookbook:: firefox
# Resource:: install
#
# Copyright:: 2012-2018, Webtrends, Inc.
# Copyright:: 2014-2018, Limelight Networks, Inc.
# Copyright:: 2017-2019, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

property :version, String, default: 'latest'
property :lang, String, default: 'en-US'

action :install do
  do_firefox_install(:install)
end

action :upgrade do
  do_firefox_install(:upgrade)
end

action_class do
  require 'net/http'
  require 'uri'

  def do_firefox_install(install_action)
    if platform_family?('windows')
      windows_package windows_package_string  do
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
        version new_resource.version unless new_resource.version == 'latest'
        action install_action
      end
    else
      raise "Unsupported platform. If you believe the Firefox cookbook can and should support this platform please open a Pull Request at https://github.com/chef-cookbooks/firefox"
    end
  end

  def windows_package_string
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
        return nil if cmd.error?
      end
      cmd.stdout.match(/Mozilla Firefox (.*)/)[1]
    end
  end

  def ff_download_url
    Net::HTTP.get_response(URI.parse("https://download.mozilla.org/?product=firefox-#{new_resource.version}&os=#{firefox_platform}&lang=#{new_resource.lang}"))['location']
  end

  # private

  def firefox_platform
    if platform_family?('windows')
      node['kernel']['machine'] == 'x86_64' ? 'win64' : 'win32'
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

# Cookbook Name:: firefox
# Recipe:: default
#
# Copyright 2012, Webtrends, Inc.
# Copyright 2014, Limelight Networks, Inc.
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

version = firefox_version
source = "#{firefox_base_uri}/#{firefox_package(version)}"
name = "Mozilla Firefox #{version} #{node['firefox']['lang']}"

if platform_family?('windows')
  windows_package name do
    source source
    installer_type :custom
    options '-ms'
    action :install
  end
elsif platform_family?('mac_os_x')
  dmg_package name do
    source source
    processes ['firefox']
    version version
    action :install
  end
else
  Chef::Log.warn('Firefox can only be installed on Windows or Mac platform using this cookbook.')
end

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

property :version, String, default: 'latest', description: 'Version of firefox to download.'
property :lang, String, default: 'en-US', description: 'Language of firefox to install. Windows and Mac OS X only'
property :package_name, String, default: lazy { firefox_package_name }, description: 'Package name to install'

description 'Installs the Firefox web browser. With no properties provided the latest version of Firefox (en-us) will be installed on the system.'
introduced '6.0.0'
examples <<EXAMPLES
Basic install:

firefox_install 'install Firefox'

Specifying a version and language

firefox_install 'install Firefox' do
  version '45.0'
  lang 'fr'

EXAMPLES

action :install do
  description 'Install the package.'

  do_firefox_install(:install)
end

action :upgrade do
  description 'Upgrade the package.'

  do_firefox_install(:upgrade)
end

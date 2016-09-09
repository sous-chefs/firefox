name 'firefox'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Installs Mozilla Firefox on multiple operating systems'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '3.0.0'

%w(redhat centos scientific amazon oracle windows mac_os_x debian ubuntu).each do |os|
  supports os
end

depends 'dmg', '>= 2.2'

source_url 'https://github.com/chef-cookbooks/firefox'
issues_url 'https://github.com/chef-cookbooks/firefox/issues'

chef_version '>= 12.1'

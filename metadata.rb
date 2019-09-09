name 'firefox'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache-2.0'
description 'Installs Mozilla Firefox on multiple operating systems'
version '6.0.0'

%w(redhat centos scientific amazon oracle windows mac_os_x debian ubuntu).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/firefox'
issues_url 'https://github.com/chef-cookbooks/firefox/issues'
chef_version '>= 14'

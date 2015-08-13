name 'firefox'
maintainer 'Tim Smith'
maintainer_email  'tsmith84@gmail.com'
license 'Apache 2.0'
description 'Installs Mozilla Firefox on multiple operating systems'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.0.2'

supports 'centos'
supports 'mac_os_x'
supports 'ubuntu'
supports 'windows'

suggests 'dmg', '~> 2.2'
suggests 'windows', '~> 1.0'

source_url 'https://github.com/tas50/firefox' if respond_to?(:source_url)
issues_url 'https://github.com/tas50/firefox/issues' if respond_to?(:issues_url)

name              'firefox'
maintainer        'Tim Smith'
maintainer_email  'tsmith@llnw.com'
license           'Apache 2.0'
description       'Installs Firefox'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '2.0.0'

supports 'centos'
supports 'redhat'
supports 'fedora'
supports 'mac_os_x'
supports 'ubuntu'
supports 'windows'

suggests 'ark', '~> 0.9'
suggests 'dmg', '~> 2.2'
suggests 'windows', '~> 1.0'

name 'firefox_test'
maintainer        'Tim Smith'
maintainer_email  'tsmith@llnw.com'
license           'Apache 2.0'
description       'Tests Firefox installs'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

depends 'firefox'
depends 'windows'
depends 'dmg'

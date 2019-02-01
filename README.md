# firefox Cookbook

[![Build Status](https://travis-ci.org/chef-cookbooks/firefox.svg?branch=master)](https://travis-ci.org/chef-cookbooks/firefox) [![Build status](https://ci.appveyor.com/api/projects/status/29bkd4a746f97ypa/branch/master?svg=true)](https://ci.appveyor.com/project/ChefWindowsCookbooks/firefox/branch/master) [![Cookbook Version](https://img.shields.io/cookbook/v/firefox.svg)](https://supermarket.chef.io/cookbooks/firefox)

This cookbook provides a resource (firefox_install) for installing firefox via package manager or downloading the binary directory from Mozilla. The resource allows specifying the version, language, and the desired action (install vs. upgrade) to perform during the install. The cookbook also ships with a default recipe that utilizes the resource in order to provide backwards compatibility with the previous cookbook releases.

## Requirements

### Platforms

- CentOS/RHEL
- Mac OS X
- Ubuntu
- Windows

### Chef

- Chef 14+

### Cookbooks

- none

## Resources

### firefox_install

Installs the Firefox web browser. With no properties provided the latest version of Firefox (en-us) will be installed on the system.

#### Actions
  - :install - install the package (default)
  - :upgrade - upgrade the package if a previous version already exists

#### Properties
  - lang - The language of the Firefox package to download (default: en-us)
  - version - The version of firefox to download (default: latest)

## Recipes

### default

The default recipe exists for backwards compatibility reasons and simply calls the firefox_install resource but passes in values specified by Chef node attributes.

#### Attributes

- `version` - Version of firefox to download. Default is `latest`.
- `lang` - Language of firefox to install. Windows and Mac OS X only. Default is `en-US`.
- `install_action` - The installation action to take (:install or :upgrade). Default is `:install`

## License and Author

```
Author:: Tim Smith(<tsmith@chef.io>)

Copyright:: 2012-2018, Webtrends, Inc.
Copyright:: 2014-2018, Limelight Networks, Inc.
Copyright:: 2017-2019, Chef Software, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

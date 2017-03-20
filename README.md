# firefox Cookbook

[![Build Status](https://travis-ci.org/chef-cookbooks/firefox.svg?branch=master)](https://travis-ci.org/chef-cookbooks/firefox) [![Cookbook Version](https://img.shields.io/cookbook/v/firefox.svg)](https://supermarket.chef.io/cookbooks/firefox)

This cookbook installs the `latest` version of Firefox by default. You can also specify a specific version, e.g. `33.0.1`. Windows and Mac OS X platforms provide an option to select a specific language with `en-US` being the default. A `firefox_version` method is also available to retrieve exact version installed.

## Requirements

### Platforms

- CentOS/RHEL
- Mac OS X
- Ubuntu
- Windows

### Chef

- Chef 12.1+

### Cookbooks

- dmg

## Attributes

- `version` - Version of firefox to download. Default is `latest`.
- `lang` - Language of firefox to install. Windows and Mac OS X only. Default is `en-US`.
- `install_action` - The installation action to take (:install or :upgrade). Default is `:install`

## Usage

Include the default recipe on a node's run_list to ensure that Firefox is installed.

The following example retrieves the version installed by using `firefox_version` method:

```ruby
v = firefox_version
```

## License and Author

```
Author:: Tim Smith(<tsmith@chef.io>)

Copyright:: Copyright (c) 2012 Webtrends Inc
Copyright:: Copyright (c) 2014 Limelight Networks, Inc.

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

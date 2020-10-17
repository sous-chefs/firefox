# firefox Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/firefox.svg)](https://supermarket.chef.io/cookbooks/firefox)
[![CI State](https://github.com/sous-chefs/firefox/workflows/ci/badge.svg)](https://github.com/sous-chefs/firefox/actions?query=workflow%3Aci)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

This cookbook provides a resource (firefox_install) for installing firefox via package manager or downloading the binary directory from Mozilla. The resource allows specifying the version, language, and the desired action (install vs. upgrade) to perform during the install. The cookbook also ships with a default recipe that utilizes the resource in order to provide backwards compatibility with the previous cookbook releases.

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you’d like to know more please visit [sous-chefs.org](https://sous-chefs.org/) or come chat with us on the Chef Community Slack in [#sous-chefs](https://chefcommunity.slack.com/messages/C2V7B88SF).

## Requirements

### Platforms

- CentOS/RHEL
- macOS
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

- `lang` - Language of firefox to install. Windows and macOS only. Default is `en-US`.
- `version` - Version of firefox to download. Default is `latest`.
- `package_name` - Package name to install. Default is `firefox_package_name` helper method.

## Recipes

### default

The default recipe exists for backwards compatibility reasons and simply calls the firefox_install resource but passes in values specified by Chef node attributes.

#### Attributes

- `version` - Version of firefox to download. Default is `latest`.
- `lang` - Language of firefox to install. Windows and macOS only. Default is `en-US`.
- `install_action` - The installation action to take (:install or :upgrade). Default is `:install`

## Contributors

This project exists thanks to all the people who [contribute.](https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false)

### Backers

Thank you to all our backers!

![https://opencollective.com/sous-chefs#backers](https://opencollective.com/sous-chefs/backers.svg?width=600&avatarHeight=40)

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website.

![https://opencollective.com/sous-chefs/sponsor/0/website](https://opencollective.com/sous-chefs/sponsor/0/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/1/website](https://opencollective.com/sous-chefs/sponsor/1/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/2/website](https://opencollective.com/sous-chefs/sponsor/2/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/3/website](https://opencollective.com/sous-chefs/sponsor/3/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/4/website](https://opencollective.com/sous-chefs/sponsor/4/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/5/website](https://opencollective.com/sous-chefs/sponsor/5/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/6/website](https://opencollective.com/sous-chefs/sponsor/6/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/7/website](https://opencollective.com/sous-chefs/sponsor/7/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/8/website](https://opencollective.com/sous-chefs/sponsor/8/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/9/website](https://opencollective.com/sous-chefs/sponsor/9/avatar.svg?avatarHeight=100)

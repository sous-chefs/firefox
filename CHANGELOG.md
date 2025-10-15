# firefox Cookbook CHANGELOG

This file is used to list changes made in each version of the firefox cookbook.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 6.1.3 - *2023-02-14*

* Remove delivery folder

## 6.1.2 - *2021-08-31*

* Standardise files with files in sous-chefs/repo-management

## 6.1.0 (2020-10-17)

### Changed

* Sous Chefs Adoption
* Update Changelog to Sous Chefs
* Update to use Sous Chefs GH workflow
* Update README to sous-chefs
* Update metadata.rb to Sous Chefs
* Update test-kitchen to Sous Chefs
* Migrate to InSpec for tests
* Move `firefox_install` library methods to helper file

### Fixed

* Yamllint fixes
* MDL Fixes

### Added

* Add `package_name` property to `firefox_install` resource and helper method
* Add CentOS 8 testing
* Add Ubuntu 20.04 testing

### Removed

* Remove Amazon Linux Support
* Remove EL 6 testing
* Remove unused `firefox_package` method

## 6.0.0 (2019-02-01)

* Added a new firefox_install custom resource and updated the recipe to just use the resource instead
* Moved the previous libraries directly into the custom resource. If you were using these in a different resource or recipe they will no longer be available and you'll need to pull them into your own cookbook
* Changed the behavior on Windows to automatically install the 64bit Firefox when on 64bit hosts

## 5.0.0 (2019-01-20)

* Require Chef 14+ and remove dmg dependency - [@tas50](https://github.com/tas50)

## 4.0.0 (2017-03-20)

* Changed the default behavior of the cookbook on Linux platforms to not install firefox during the compile phase and to use an install action not an upgrade action. The fixes race conditions between the apt_update and the installation. If you would still like to upgraade firefox by default there is an attribute to control the install action now.
* Fixed failing Chefspecs
* Added appveyer testing for Windows installation
* Fixed compile time failures if firefox is not on the system at all
* Set the minimum chef release to 12.6 so we'll have windows_package resources built in

## 3.0.1 (2017-03-03)

* Update the minimum chef release to 12.1 from 12.0
* Allow dmg 3.0 cookbook by loosening the dependency
* Cookstyle updates
* Test with Local Delivery and not Rake
* Remove EOL platforms from the kitchen configs and add OS X

## 3.0.0 (2016-09-02)

* Replace apt cookbook with apt_update in test
* Add windows boxes for testing in test kitchen
* Require Chef 12 or later
* Use Chef's built in package instead of windows_package from the windows cookbook
* Fix downloading since Mozilla changed how latest works

## 2.0.7

* Transfer ownership to Chef
* Add maintainers.md and testing.md docs
* Add Rakefile for simplified testing

## 2.0.6

* Require dmg and windows in the metadata instead of suggesting.  The suggests property in metadata is not actually used in depsolving and should be avoided.
* Depend on a more recent version of the Windows cookbook that properly handles Chef 12
* Add full integration testing with kitchen-docker in Travis

## 2.0.5

* Fix redirection forbidden

## 2.0.4

* Update platforms tested with Kitchen CI
* Run Travis CI tests in the container infrastructure and cache bundler installs
* Add a simple contributing doc
* Update development dependencies and breakout gems into groups
* Add license file
* Add cookbook version badge to readme
* Add cookbook and chef requirements to the readme
* Add license to the readme
* Add source_url and issues_url to metadata

## 2.0.2

* Fix installations on OS X
* Fix the Windows package name in the registry to prevent installs on each run
* Add a VMware Fusion Test Kitchen file for OS X testing
* Chefspec fixes
* Gemfile dependencies loosened

## 2.0.0

* Add support for Mac OS X, CentOS, and Ubuntu platforms
* Automatically determine latest Firefox package version
* Add firefox_version method that returns version installed
* Add a ability to select language for Windows and Mac OS X platforms
* Replace download URL with releases URL

## 1.1.1

* Install Firefox 32.0.3

## 1.1.0

* Install Firefox 30.0.0
* Switch to the new URL for the Firefox download CDN
* Add a new attribute for defining what version of Firefox to download ['firefox']['version']

## 1.0.7

* Install Firefox 25.0.1

## 1.0.6

* Install Firefox 17.0.1

## 1.0.5

* Update the download URL for Firefox since Mozilla changed hosts

## 1.0.4

* Bump from Firefox 15.0.1 to 16.0.1

## 1.0.3

* Fix the download URL

## 1.0.2

* Update to Firefox 15.0.1

## 1.0.1

* Update to Firefox 15

## 1.0.0

* Initial release with a Changelog
* Update to Firefox 14.0.1 from 13.0.1

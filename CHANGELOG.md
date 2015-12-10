# firefox Cookbook CHANGELOG
This file is used to list changes made in each version of the firefox cookbook.

## 2.0.7
- Transfer ownership to Chef
- Add maintainers.md and testing.md docs
- Add Rakefile for simplified testing

## 2.0.6
- Require dmg and windows in the metadata instead of suggesting.  The suggests property in metadata is not actually used in depsolving and should be avoided.
- Depend on a more recent version of the Windows cookbook that properly handles Chef 12
- Add full integration testing with kitchen-docker in Travis

## 2.0.5
- Fix redirection forbidden

## 2.0.4
- Update platforms tested with Kitchen CI
- Run Travis CI tests in the container infrastructure and cache bundler installs
- Add a simple contributing doc
- Update development dependencies and breakout gems into groups
- Add license file
- Add cookbook version badge to readme
- Add cookbook and chef requirements to the readme
- Add license to the readme
- Add source_url and issues_url to metadata

## 2.0.2
- Fix installations on OS X
- Fix the Windows package name in the registry to prevent installs on each run
- Add a VMware Fusion Test Kitchen file for OS X testing
- Chefspec fixes
- Gemfile dependencies loosened

## 2.0.0
- Add support for Mac OS X, CentOS, and Ubuntu platforms
- Automatically determine latest Firefox package version
- Add firefox_version method that returns version installed
- Add a ability to select language for Windows and Mac OS X platforms
- Replace download URL with releases URL

## 1.1.1
- Install Firefox 32.0.3

## 1.1.0
- Install Firefox 30.0.0
- Switch to the new URL for the Firefox download CDN
- Add a new attribute for defining what version of Firefox to download ['firefox']['version']

## 1.0.7:
- Install Firefox 25.0.1

## 1.0.6:
- Install Firefox 17.0.1

## 1.0.5:
- Update the download URL for Firefox since Mozilla changed hosts

## 1.0.4:
- Bump from Firefox 15.0.1 to 16.0.1

## 1.0.3:
- Fix the download URL

## 1.0.2:
- Update to Firefox 15.0.1

## 1.0.1:
- Update to Firefox 15

## 1.0.0:
- Initial release with a Changelog
- Update to Firefox 14.0.1 from 13.0.1

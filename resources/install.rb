# frozen_string_literal: true

provides :firefox_install
unified_mode true

include Firefox::Cookbook::Helpers

property :version, String, default: 'latest', description: 'Version of Firefox to install.'
property :lang, String, default: 'en-US', description: 'Language of Firefox to install. Windows and macOS only.'
property :manage_repository, [true, false], default: true, description: 'Configure Mozilla package repositories on Linux.'
property :package_name, String, default: lazy { default_firefox_package_name(manage_repository) }, description: 'Package name to install'

description 'Installs the Firefox web browser. With no properties provided the latest version of Firefox (en-us) will be installed on the system.'
introduced '6.0.0'
examples <<EXAMPLES
Basic install:

firefox_install 'install Firefox'

Specifying a version and language

firefox_install 'install Firefox' do
  version '45.0'
  lang 'fr'

EXAMPLES

default_action :install

action_class do
  include Firefox::Cookbook::Helpers
end

action :install do
  description 'Install the package.'

  install_firefox(:install)
end

action :upgrade do
  description 'Upgrade the package.'

  install_firefox(:upgrade)
end

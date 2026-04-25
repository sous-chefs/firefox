# Migration

This cookbook has migrated to a resource-only API. Top-level `recipes/` and `attributes/` are no longer shipped.

## Previous Recipe and Attribute API

Older releases commonly used the default recipe:

```ruby
include_recipe 'firefox::default'
```

That recipe read node attributes and forwarded them to `firefox_install`:

```ruby
default['firefox']['version'] = nil
default['firefox']['lang'] = nil
default['firefox']['install_action'] = nil
```

## New Resource API

Call `firefox_install` directly from your own cookbook recipes.

```ruby
firefox_install 'firefox'
```

Attribute values map to resource properties as follows:

| Old attribute | New property |
| --- | --- |
| `node['firefox']['version']` | `version` |
| `node['firefox']['lang']` | `lang` |
| `node['firefox']['install_action']` | `action` |

For example, replace this old pattern:

```ruby
node.default['firefox']['version'] = '140.0.2'
node.default['firefox']['lang'] = 'fr'
node.default['firefox']['install_action'] = :install

include_recipe 'firefox::default'
```

with:

```ruby
firefox_install 'firefox' do
  version '140.0.2'
  lang 'fr'
  action :install
end
```

## Linux Repository Behavior

The resource now manages Mozilla APT repositories by default on Debian-family Linux so Ubuntu and Debian installs use Mozilla packages consistently. RPM and SUSE platforms use distribution package repositories by default because Mozilla's RPM signing key is not compatible with the default crypto policy on some current EL-family platforms.

Set `manage_repository false` to keep using your platform's configured package repositories:

```ruby
firefox_install 'firefox' do
  manage_repository false
end
```

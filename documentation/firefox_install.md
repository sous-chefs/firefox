# firefox_install

Installs Mozilla Firefox.

## Actions

| Action | Description |
| --- | --- |
| `:install` | Installs Firefox. This is the default action. |
| `:upgrade` | Upgrades Firefox when a previous version is already installed. |

## Properties

| Property | Type | Default | Description |
| --- | --- | --- | --- |
| `version` | String | `'latest'` | Firefox version to install. On Linux, non-latest values are passed to the package manager. |
| `lang` | String | `'en-US'` | Firefox language to install. This applies to Windows and macOS downloads. |
| `package_name` | String | computed | Package name to install on Linux. Defaults to `firefox` except openSUSE without Mozilla repositories, where it defaults to `MozillaFirefox`. |
| `manage_repository` | true, false | `true` | Configures Mozilla APT repositories on Debian-family Linux before installing Firefox. RPM and SUSE platforms use distribution packages by default. |

## Examples

### Install Firefox

```ruby
firefox_install 'firefox'
```

### Install a specific package version

```ruby
firefox_install 'firefox' do
  version '140.0.2'
end
```

### Use the distribution package repository

```ruby
firefox_install 'firefox' do
  manage_repository false
end
```

### Upgrade Firefox

```ruby
firefox_install 'firefox' do
  action :upgrade
end
```

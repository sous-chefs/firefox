# Limitations

## Package Availability

### APT (Debian/Ubuntu)

* Mozilla publishes an APT repository at `https://packages.mozilla.org/apt` for Debian, Ubuntu, and Debian-based distributions.
* The Mozilla APT repository provides `firefox`, `firefox-esr`, beta, nightly, developer edition, and language pack packages.
* Debian 12 and 13 and Ubuntu 22.04 and 24.04 are current targets for this cookbook.

### DNF/YUM (RHEL family, Fedora, Amazon Linux)

* Mozilla publishes an RPM repository at `https://packages.mozilla.org/rpm/firefox` for Fedora and RPM-based distributions.
* The Mozilla RPM repository provides `firefox` and `firefox-l10n-*` packages, but its signing key fails under the default crypto policy on some current EL-family platforms because SHA1 signatures are disabled.
* The cookbook therefore uses distribution package repositories by default on RPM platforms.
* AlmaLinux 8, 9, and 10; Amazon Linux 2023; CentOS Stream 9 and 10; Fedora 43; Oracle Linux 8 and 9; and Rocky Linux 8, 9, and 10 are current Dokken targets where distribution repositories provide Firefox unless noted otherwise by Kitchen.
* Oracle Linux 10 is not included in Kitchen/CI because no `dokken/oraclelinux-10` image was identified during migration.

### Zypper (openSUSE)

* Mozilla documents the same RPM repository for zypper-based installation.
* The cookbook uses openSUSE distribution packages by default and installs `MozillaFirefox`.
* openSUSE Leap 16.0 is the current tested openSUSE target.

### Windows and macOS

* Current Firefox system requirements list Windows 10 or later.
* Current Firefox system requirements list macOS 10.15 or later.
* Windows and macOS installation uses Mozilla's download redirect service, not a package repository.

## Architecture Limitations

* Mozilla publishes Linux downloads for 32-bit, 64-bit, and ARM64/AArch64 builds.
* The current Kitchen and CI matrix verifies Linux `amd64` Dokken images only.
* Firefox on Linux requires glibc 2.17 or newer on x86_64 and glibc 2.28 or newer on arm64.

## Source/Compiled Installation

This cookbook does not build Firefox from source. It installs Firefox through Mozilla package repositories, distribution package managers, or Mozilla's Windows/macOS download redirect service.

## Removed EOL Targets

* CentOS Linux 7 and 8 are EOL.
* CentOS Stream 8 is EOL.
* Debian 9, 10, and 11 are EOL for standard support.
* Ubuntu 16.04, 18.04, 20.04, and 23.04 are EOL for standard support.
* Oracle Linux 7 is EOL for Premier Support.
* Scientific Linux is no longer supported by this cookbook.

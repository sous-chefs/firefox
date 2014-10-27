Description
===========

This cookbook installs the latest en-US version of Firefox by default. You can also install a specific 
version or lang by overriding attributes.  

Requirements
============

Platform
--------

* Windows Vista
* Windows 7
* Windows Server 2012 (R1, R2)
* Windows Server 2008 (R1, R2)
* Windows 2003 (R1 / R2)
* Windows XP

Cookbooks
---------

- windows

Attributes
==========

* version: Version of firefox to download.  Default is `latest`.
* lang: Language of firefox to install.  Default is `en-US`.
* releases_url: URL for the releases directory. 

Usage
=====

Include the default recipe on a node's runlist to ensure that Firefox is installed.

A `firefox_version` method is available to retrieve exact version installed.

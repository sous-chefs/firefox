Description
===========

This cookbook installs Firefox 30.0.0

Requirements
============

Platform
--------

* Windows Vista
* Windows 7
* Windows Server 2008 (R1, R2)
* Windows 2003 (R1 / R2)
* Windows XP


Attributes
==========

* http_url: URL for the installer package.  Defaults to a mirror on leaseweb.com
* version: Version of the chef client to download.  If the default http_url is specified this is used to build the download URL

Usage
=====

Include the default recipe on a node's runlist to ensure that Firefox is installed

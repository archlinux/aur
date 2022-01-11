# About

Arch package for Kaspersky Endpoint Security for Linux (KESL)

## Configuration

The following explains how this package behaves during install, re-install, upgrade and removal. For a manual configuration based on the resulting configuration files check out the last topic ***"Manual configuration / import"***

### Installation

[kesl.ini](kesl.ini) can be modified to set some basic stuff like using a proxy server or a specific admin user account on initial installation etc.

For the rest it is recommended to use configuration files instead as explained in the next topic.

### Settings

kesl does not backup nor restore your configuration during an upgrade or re-install but this package does.

The real configuration of kesl is done either by using the CLI command `kesl-control` and one of the `--setXXXX` options - or importing a config file.

This package uses the config file approach to be able to save and restore: all config files in `/ect/kesl/` are being read during install, re-install or upgrade.

Once you have walked through the configuration possibilites available you will find quickly that loosing these configs could hurt a lot. Especially when you fully uninstall this pkg and re-install it somewhen later.

***spoiler: On uninstall all `/etc/kesl/<setting>.conf` files will be removed - but NOT `/etc/kesl/<setting>.conf.persistent`***

So to keep all the work you did another option is available: the use of `persistent` files:

For every file `/etc/kesl/<setting>.conf` you can simply copy it to `<setting>.conf.persistent` and it will never get overwritten or deleted by the installer. 

***Note: You can NOT choose any name for these `<setting>.conf` or `<setting>.conf.persistent` files!<br/>Only those [available](kesl.install#L8-L22) can be used.***

Examples:

~~~
sudo cp /etc/kesl/app.conf /etc/kesl/app.conf.persistent
sudo cp /etc/kesl/Update.conf /etc/kesl/Update.conf.persistent
~~~

Then edit the `persistent` file to your needs and on next upgrade, install, re-install the persistent file will be read and used - even when there's a newer configuration file from a running config.

#### PKGBUILD: Install

1. restoring `persistent` configuration from all `/ect/kesl/<setting>.conf.persistent` files
1. the default configuration (including the one restored from persistent files) will be saved automatically to `/ect/kesl/<setting>.conf` - **overwriting any existing**

#### PKGBUILD: Upgrade / Re-install

1. before the upgrade/re-install starts the current running configuration will be saved automatically to `/ect/kesl/<setting>.conf` - **overwriting any existing**
1. after the upgrade finished all `/ect/kesl/<setting>.conf` will be restored
1. all `/ect/kesl/<setting>.conf.persistent` files will be restored (so any `persistent` config will have precedence)

#### PKGBUILD: Remove

1. all `/ect/kesl/<setting>.conf` files will be **removed** but `/ect/kesl/<setting>.conf.persistent` are **kept**

#### Manual configuration / import

Of course you can modify these `/ect/kesl/<setting>.conf` or better `/ect/kesl/<setting>.conf.persistent` files and then use them to configure kesl independent from the above described package process. For that you just need to pick the right `kesl-control` task and feed it with that configuration file of your choice.

You can read more about the options etc here: https://support.kaspersky.com/KES4Linux/11/en-US/161263.htm


# Maintainer: Ryan Davies <ryan@ryandavies.co.nz>

pkgname=home-assistant-hassio
pkgdesc='Open-source home automation platform running on Python 3 within Docker'
pkgver=0.1
pkgrel=2
url="https://home-assistant.io/"
license=('APACHE')
arch=('any')
replaces=('python-home-assistant' 'home-assistant')
# NB: this package will install additional python packages in /var/lib/hass/lib depending on components present in the configuration files.
depends=('curl'
	'bash'
	'docker'
	'jq'
	'avahi'
	'dbus'
	'networkmanager'
	'systemd'
         )
install='hassio.install'

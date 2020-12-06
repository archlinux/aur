# Maintainer: Librewish <librewish@gmail.com>

pkgname=jack-support
pkgver=1
pkgrel=1
arch=('any')
url="https://wiki.archlinux.org/index.php/Advanced_Linux_Sound_Architecture"
license=('GPL')
pkgdesc="Meta package for alsa support."
		depends=("jack"
            "jack_capture"
			"jack_utils"
			"python-dbus"
			"celt"
			"libffado"
			"realtime-privileges"
			"a2jmidid"
			"zita-ajbridge")
	optdepends=('qjackctl: A Qt front-end for the JACK low-latency audio server'
                        'cadence: JACK toolbox for audio production')
replaces=("garuda-jack")
install=jack.install


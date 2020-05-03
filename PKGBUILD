# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Valerio Pizzi (Pival81) <pival81@yahoo.com>

pkgname=arxlibertatis-bin
_pkgname=arx-libertatis
pkgver=1.1.2
pkgrel=3
rpmrel=9.1
pkgdesc='Cross-platform port of Arx Fatalis, a first-person role-playing game. (binary version)'
url='http://arx-libertatis.org/'
arch=('x86_64')
license=('GPL3')
depends=('sdl' 'openal' 'glew1.10')
optdepends=('qt5-base: enable built-in crash handler (Qt5 version; recompile needed)'
            'gdb: generate detailed crash reports'
	    'arxfatalis-data-copy: Arx Fatalis game data, required to play'
	    'arxfatalis-data-demo: Arx Fatalis game data from the demo, required to play'
	    'arxfatalis-data-gog: Arx Fatalis game data from the GOG installer, required to play')

provides=('arxlibertatis')
conflicts=('arxlibertatis' 'arx-libertatis-git')
source=("https://download.opensuse.org/repositories/home:/dscharrer/Fedora_30/x86_64/$_pkgname-$pkgver-$rpmrel.x86_64.rpm")
md5sums=('d49c9b2849e3fe16ccd0c9248eeda0b2')

package() {
	bsdtar -C $pkgdir -xf $srcdir/$_pkgname-$pkgver-*.rpm 
}


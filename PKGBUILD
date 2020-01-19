# Maintainer: Valerio Pizzi (Pival81) <pival81@yahoo.com>

pkgname=arxlibertatis-bin
_pkgname=arx-libertatis
pkgver=1.1.2
pkgrel=2
rpmrel=9
pkgdesc='Cross-platform port of Arx Fatalis, a first-person role-playing game. (binary version)'
url='http://arx-libertatis.org/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl' 'openal' 'glew1.10')
optdepends=('qt5: enable built-in crash handler (Qt5 version; recompile needed)'
            'gdb: generate detailed crash reports'
	    'arxfatalis-data-copy: Arx Fatalis game data, required to play'
	    'arxfatalis-data-demo: Arx Fatalis game data from the demo, required to play'
	    'arxfatalis-data-gog: Arx Fatalis game data from the GOG installer, required to play')

provides=('arxlibertatis')
conflicts=('arxlibertatis' 'arx-libertatis-git')
source_x86_64=("http://download.opensuse.org/repositories/home:/dscharrer/Fedora_30/x86_64/$_pkgname-$pkgver-$rpmrel.1.x86_64.rpm")
source_i386=("http://download.opensuse.org/repositories/home:/dscharrer/Fedora_30/i686/$_pkgname-$pkgver-$rpmrel.1.i686.rpm")
sha512sums_x86_64=('c46478491f8014cc9fdeb90e6b66c274112a513c85f1491eb73cd675c371d2cb87c23c0b6785187d29f8be3033d2deb496990ec7b386d54676e1790bceb31622')
sha512sums_i386=('89e24e69605f7a468a2c71577aceda80cb0e3f8efebd5e54caffebfaa4cac29b0adbe8c7d1357612f30282abbd5711495d4b155e0b29ee0ec64356059d9fe995')

package() {
	bsdtar -C $pkgdir -xf $srcdir/$_pkgname-$pkgver-*.rpm 
}


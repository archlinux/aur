# Maintainer: Valerio Pizzi (Pival81) <pival81@yahoo.com>

pkgname=arxlibertatis-bin
_pkgname=arx-libertatis
pkgver=1.1.2
pkgrel=1
rpmrel=4
pkgdesc='Cross-platform port of Arx Fatalis, a first-person role-playing game. (binary version)'
url='http://arx-libertatis.org/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl' 'openal' 'glew1.10')
optdepends=('qt: enable built-in crash handler (Qt5 version; recompile needed)'
            'qt4: enable built-in crash handler (Qt4 version; recompile needed)'
            'gdb: generate detailed crash reports'
	    'arxfatalis-data-copy: Arx Fatalis game data, required to play'
	    'arxfatalis-data-demo: Arx Fatalis game data from the demo, required to play'
	    'arxfatalis-data-gog: Arx Fatalis game data from the GOG installer, required to play')

provides=('arxlibertatis')
conflicts=('arxlibertatis' 'arx-libertatisgit')
source_x86_64=("http://download.opensuse.org/repositories/home:/dscharrer/Fedora_23/x86_64/$_pkgname-$pkgver-$rpmrel.1.x86_64.rpm")
source_i386=("http://download.opensuse.org/repositories/home:/dscharrer/Fedora_23/i686/$_pkgname-$pkgver-$rpmrel.1.i686.rpm")

md5sums_x86_64=("576b07947d3a834d07e49232791753bd")
md5sums_i386=("042f113c9e3e82715c0c7554b3fdfb2c ")

package() {
	bsdtar -C $pkgdir -xf $srcdir/$_pkgname-$pkgver-*.rpm 
}


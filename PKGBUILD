# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Valerio Pizzi (Pival81) <pival81@yahoo.com>

_pkgname=arx-libertatis
pkgname=$_pkgname-bin
pkgver=1.2.1
pkgrel=1
rpmrel=114
pkgdesc='Cross-platform port of Arx Fatalis, a first-person role-playing game. (binary version)'
url='https://arx-libertatis.org/'
arch=('x86_64')
license=('GPL3')
depends=('sdl' 'openal' 'glew1.10')
optdepends=('qt5-base: enable built-in crash handler (Qt5 version; recompile needed)'
            'gdb: generate detailed crash reports'
	    'arx-fatalis-data-copy: Arx Fatalis game data, required to play'
	    'arx-fatalis-data-demo: Arx Fatalis game data from the demo, required to play'
	    'arx-fatalis-data-gog: Arx Fatalis game data from the GOG installer, required to play')

provides=('arxlibertatis')
conflicts=('arxlibertatis' 'arx-libertatis-git')
source=("https://download.opensuse.org/repositories/home:/dscharrer/Fedora_Rawhide/x86_64/$_pkgname-$pkgver-1.$rpmrel.x86_64.rpm")
sha256sums=('63e4cf987ca3d51507eb4f4f0efdea50ddb70efee40349caa551d1f11a81c5c3')

package() {
	bsdtar -C $pkgdir -xf $srcdir/$_pkgname-$pkgver-*.rpm 
}


# Maintainer: Hydral <nathan.dacunha.nd@gmail.com>

pkgname=solarus-bin
pkgver=1.6.5.dev.700953463
pkgrel=1
arch=('x86_64')
pkgdesc="A lightweight, free and open-source game engine for Action-RPGs"
url="http://www.solarus-games.org/"
license=('GPL3')
depends=('glm'
         'hicolor-icon-theme'
         'libmodplug>=0.8.8.4'
         'libvorbis'
         'luajit>=2.0'
         'openal'
         'physfs'
         'qt5-base'
         'sdl2>=2.0.6'
         'sdl2_image'
         'sdl2_ttf')
source=("https://gitlab.com/solarus-games/solarus/-/jobs/700953463/artifacts/download")
provides=('solarus')
conflicts=('solarus' 'solarus-run' 'solarus-git')
package() {
    mkdir -p "$pkgdir/usr"
	cd $srcdir
	mv staging/* $pkgdir/usr
}
md5sums=('ddd7da10b08dee2b88b5c66a704444f6')

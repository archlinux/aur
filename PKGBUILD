# Maintainer: Hydral <nathan.dacunha.nd@gmail.com>

pkgname=solarus-bin
pkgver=1.7.0.dev.731973863
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
source=("https://gitlab.com/solarus-games/solarus/-/jobs/943695049/artifacts/download")
provides=('solarus')
conflicts=('solarus' 'solarus-run' 'solarus-git')
package() {
    mkdir -p "$pkgdir/usr"
	cd $srcdir
	mv staging/* $pkgdir/usr
}
md5sums=('6c55c9f5e37065bc45d2fd18f1c0f9fd')

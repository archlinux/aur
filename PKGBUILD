# Maintainer: Hydral <nathan.dacunha.nd@gmail.com>
# Co-maintainer: Qontinuum <qontinuum.dev@protonmail.ch>

_jobId=1450728401 
pkgname=solarus-bin
pkgver=1.7.0.dev.$_jobId
pkgrel=1
arch=('x86_64')
pkgdesc='A lightweight, free and open-source game engine for Action-RPGs'
url='https://gitlab.com/solarus-games/solarus'
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
source=("$pkgname-$pkgver.zip::https://gitlab.com/solarus-games/solarus/-/jobs/$_jobId/artifacts/download")
provides=('solarus')
conflicts=('solarus')
b2sums=('ff1cca75df559ecda54377ae6ca7ff6541900966a107ee756b008fdf65dc1043a4717023eb1d7134bcea6678d9fcb71f0c743b1b3775ed64f060c873851fb7cf')

package() {
  cd "$srcdir/staging"
  install -dm755 "$pkgdir/usr"
  mv * "$pkgdir/usr"
}
# vim:set sw=2 et:

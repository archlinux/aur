# Maintainer: Hydral <hydraldev@gmail.com>
# Co-maintainer: Qontinuum <qontinuum.dev@protonmail.ch>

_jobId=1804734803 
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
b2sums=('2211dce4e84d2bab95aa017484dd608dec49129f62bf70323f555b7dca6393715f22fee8f8edbd67a4d90d3a6d2dcea988a328227d14543e5537b4cc5d54718e')

package() {
  cd "$srcdir/staging"
  install -dm755 "$pkgdir/usr"
  mv * "$pkgdir/usr"
}
# vim:set sw=2 et:

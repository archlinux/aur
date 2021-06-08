# Maintainer: Hydral <nathan.dacunha.nd@gmail.com>
# Co-maintainer: Qontinuum <qontinuum.dev@protonmail.ch>

_jobId=1316756074  
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
b2sums=('69c41d7d760df73811530f63179c3ca396a3707f2b49341daebdb5085853a13c35f04de516b7e5db85522b939593e0eab463c99e9a66a12574a884997d696256')

package() {
  cd "$srcdir/staging"
  install -dm755 "$pkgdir/usr"
  mv * "$pkgdir/usr"
}
# vim:set sw=2 et:

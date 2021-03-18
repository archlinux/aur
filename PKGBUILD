# Maintainer: Hydral <nathan.dacunha.nd@gmail.com>
# Co-maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

_jobId=1106943887
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
makedepends=('unzip')
source=("$pkgname-$pkgver.zip::https://gitlab.com/solarus-games/solarus/-/jobs/$_jobId/artifacts/download")
provides=('solarus')
conflicts=('solarus')
b2sums=('fae7d5f1a0fc2b4df47042fd92f29cabd2430a4877931ce0a65481df75d106a80a0d309d3b12a778a9218f04a490e7f0036e7867f068942281aa6d38422d4ce1')

package() {
  cd "$srcdir/staging"
  install -dm755 "$pkgdir/usr"
  mv * "$pkgdir/usr"
}

# vim:set sw=2 et:

# Maintainer: Hydral <nathan.dacunha.nd@gmail.com>
# Co-maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

_jobId=1134933283
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
b2sums=('a372ffdf323430b412f32340004fe36aae9ee70bd551f6dc384b1c08134d9700dba44441897c9c053ab9f509c6a7399185e941e72b50a2adcadec492e086e6e0')

package() {
  cd "$srcdir/staging"
  install -dm755 "$pkgdir/usr"
  mv * "$pkgdir/usr"
}

# vim:set sw=2 et:

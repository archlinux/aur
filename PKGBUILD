# Maintainer: Hydral <nathan.dacunha.nd@gmail.com>
# Co-maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

_jobId=1045101871
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
b2sums=('c52a43b858890595a525efe4b5ec71c21c991abe87cdf1dae591d3fc916d433b04e246727452a0719590635730654cdf1126279b5e673df42547fbfbc2e4233d')

package() {
  cd "$srcdir/staging"
  install -dm755 "$pkgdir/usr"
  mv * "$pkgdir/usr"
}

# vim:set sw=2 et:

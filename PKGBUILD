# Maintainer: Hydral <nathan.dacunha.nd@gmail.com>
# Co-maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

_jobId=1164524974 
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
b2sums=('a0b4e196f6958c4e1a20058d3c4c4ff753678a4f2de1641edca55e1425e3f952a437dff77eaf842d1365de2368f9f90460a4a186640fd6049821acd5309a855d')

package() {
  cd "$srcdir/staging"
  install -dm755 "$pkgdir/usr"
  mv * "$pkgdir/usr"
}
# vim:set sw=2 et:

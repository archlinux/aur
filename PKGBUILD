# Maintainer: Hydral <nathan.dacunha.nd@gmail.com>
# Co-maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

_jobId=1187465154 
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
b2sums=('052fcd3d61214adb5abe5893fbbb289e83090fbad5089d6692e1902bc50e652e8849c0178c712bd66204baf63d1f79284de14b6051b6ac0cc65f6d78eae80aab')

package() {
  cd "$srcdir/staging"
  install -dm755 "$pkgdir/usr"
  mv * "$pkgdir/usr"
}
# vim:set sw=2 et:

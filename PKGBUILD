# Contributor: Daniel Milde <daniel@milde.cz>
pkgname=tinyandbig
pkgver=0.6
pkgrel=1
pkgdesc="Tiny & Big - up that mountain - demo BETA"
arch=('i686' 'x86_64')
url="http://www.tinyandbig.com/"
license=('custom')
depends=('openal' 'sdl' 'sdl_mixer' 'nvidia-cg-toolkit')
source=(http://tinyandbig.com/downloads/${pkgname}_upthatmountain_linux-${pkgver}.tar.bz2 run.sh tinyandbig.desktop)
md5sums=('441d4224db73354853ce3adb172ffa5f' '6a3129e01897004b5bb930de19ed5117' '2d6c1066b1bee1b8508d4e9c0368a1db')

build() {
  install -dm755 ${pkgdir}/opt/tinyandbig
  install -dm755 ${pkgdir}/usr/bin
  cp -r ${srcdir}/tinyandbig/* ${pkgdir}/opt/tinyandbig/
  install -Dm755 ${srcdir}/run.sh ${pkgdir}/usr/bin/tinyandbig
  install -D ${srcdir}/tinyandbig.desktop ${pkgdir}/usr/share/applications/tinyandbig.desktop
}

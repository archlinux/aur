# Maintainer: Bartosz Chmura <chmurli@gmail.com>

pkgname=ttf-chromeos-fonts
_pkgname=croscorefonts-1.23.0
pkgver=1.23.0
pkgrel=5
pkgdesc="Chrome OS true type fonts: Arimo, Tinos and Cousine"
arch=('any')
url="http://code.google.com/p/chromium-os/issues/detail?id=5287"
license=('apache')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-google-webfonts')
install=$pkgname.install
source=("${_pkgname}.tar.gz::http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/${_pkgname}.tar.gz")
sha256sums=('b469b5457b093a9d8878ef6ff6868f54e258441b88983b1866f64c8995584b4c')


package() {
  mkdir -p ${pkgdir}/usr/share/fonts/TTF
  install -m644 ${srcdir}/${_pkgname}/*.ttf ${pkgdir}/usr/share/fonts/TTF
}

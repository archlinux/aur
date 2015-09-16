# Maintainer: 2ion
pkgname=ttf-din1451
pkgver=20100402
pkgrel=2
pkgdesc='Clone of the DIN1451 font as used on German roadsigns'
arch=('any')
url='https://github.com/2ion/ttf-din1451'
license=('custom:unknown')
source=("https://github.com/2ion/ttf-din1451/archive/${pkgver}.tar.gz")
sha256sums=('a36834c573c4504e088d90ce2f85237a015ee69a15412612e7e6a109fef7ac29')
install=${pkgname}.install

package() {
  cd "${pkgname}-${pkgver}/postprocessed"
  for fontfile in *.ttf; do
    install -Dm644 "$fontfile" "${pkgdir}/usr/share/fonts/${pkgname}/${fontfile}"
  done
}

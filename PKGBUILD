# Maintainer: Navdeep Sidhu <dev@navisidhu.com>

pkgname=otf-saab
pkgver=0.91
pkgrel=1
pkgdesc="Saab is the first ever freely available, Unicode 4.0 compliant, OpenType, Gurmukhi (Punjabi) font."
arch=(any)
url="http://guca.sourceforge.net/typography/fonts/saab/"
license=('GPL')
depends=(fontconfig xorg-font-utils)
source=("http://prdownloads.sourceforge.net/guca/saab.0.91.otf")
md5sums=("1c75f83212904341ce7fe9e77a0f8146")
install=${pkgname}.install

package() {
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 "${srcdir}/"*.otf "$pkgdir/usr/share/fonts/OTF/"
}
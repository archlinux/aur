# Maintainer: Murphy <https://aur.archlinux.org/account/Murph>

pkgname=otf-avenir-next-pro
pkgver=1
pkgrel=1
pkgdesc="Avenir Next Pro fonts"
arch=('any')
url="https://www.dfonts.org/fonts/avenir-next-font/"
license=('custom:Personal Use Only')
source=("https://www.dfonts.org/wp-content/uploads/fonts/Avenir_Next_Pro.zip")
sha256sums=('9eda9cbbec23927172b67283a261c3b38330f7d02536e169f2c630a14bc1b854')

package() {
  install -d "${pkgdir}/usr/share/fonts/OTF/"
  install -m644 "${srcdir}/Avenir_Next_Pro/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
}

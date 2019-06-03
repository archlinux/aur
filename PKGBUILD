# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

# check for new releases at:
#   https://github.com/gorhill/uBlock/releases

pkgname=chromium-ublock-origin
pkgver=1.19.6
pkgrel=2
pkgdesc='An efficient blocker for Chromium'
arch=('any')
url='https://github.com/gorhill/uBlock'
license=('GPL3')
makedepends=('git' 'zip')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install="${pkgname}.install"
source=("https://github.com/gorhill/uBlock/releases/download/${pkgver}/uBlock0_${pkgver}.chromium.zip")
md5sums=('093a010bcf8856d0da03759d282c453c')

package() {
   mkdir -p "${pkgdir}/usr/share/${pkgname}"
   cp -dr --no-preserve=ownership "${srcdir}/uBlock0.chromium"/* "${pkgdir}/usr/share/${pkgname}/"
}

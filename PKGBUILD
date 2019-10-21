# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

# check for new releases at:
#   https://github.com/gorhill/uBlock/releases

pkgname=chromium-ublock-origin
pkgver=1.23.0
pkgrel=1
pkgdesc='An efficient blocker for Chromium'
arch=('any')
url='https://github.com/gorhill/uBlock'
license=('GPL3')
makedepends=('git' 'zip')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install="${pkgname}.install"
source=("https://github.com/gorhill/uBlock/releases/download/${pkgver}/uBlock0_${pkgver}.chromium.zip")
md5sums=('01db45dd8c58029eb3a6553acabd3fb6')

package() {
   mkdir -p "${pkgdir}/usr/share/${pkgname}"
   cp -dr --no-preserve=ownership "${srcdir}/uBlock0.chromium"/* "${pkgdir}/usr/share/${pkgname}/"
}

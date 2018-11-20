# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

# check for new releases at:
#   https://github.com/gorhill/uBlock/releases

pkgname=chromium-ublock-origin
pkgver=1.17.2
pkgrel=1
pkgdesc="An efficient blocker for Chromium"
arch=('any')
url="https://github.com/gorhill/uBlock"
license=('GPL3')
makedepends=('git' 'zip')
optdepends=('chromium' 'google-chrome')
install="${pkgname}.install"
source=("https://github.com/gorhill/uBlock/releases/download/${pkgver}/uBlock0.chromium.zip")
md5sums=('15a59f69a5aa619e9fc558b62c4ca6db')

package() {
   mkdir -p "${pkgdir}/usr/share/${pkgname}"
   cp -dr --no-preserve=ownership "${srcdir}/uBlock0.chromium"/* "${pkgdir}/usr/share/${pkgname}/"
}

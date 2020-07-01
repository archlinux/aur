# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=chromium-ublock-origin
pkgver=1.28.0
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
md5sums=('e5045c2530c911addd300848bd35d588')

package() {
   mkdir -p "${pkgdir}/usr/share/${pkgname}"
   cp -dr --no-preserve=ownership "${srcdir}/uBlock0.chromium"/* "${pkgdir}/usr/share/${pkgname}/"
}

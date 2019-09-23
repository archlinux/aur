# Maintainer: Yurii <yu hrysh at proton mail dot com>

pkgname=chromium-extension-adnauseam
pkgver=3.8.401
pkgrel=1
pkgdesc='An ad-blocker which silently simulates clicks on each blocked ad, confusing trackers'
arch=('any')
url='https://adnauseam.io'
license=('GPL3')
makedepends=('zip')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install="${pkgname}.install"
source=("https://github.com/dhowe/AdNauseam/releases/download/v${pkgver}/adnauseam-${pkgver}.chromium.zip")

package() {
   mkdir -p "${pkgdir}/usr/share/${pkgname}"
   cp -dr --no-preserve=ownership "${srcdir}/adnauseam.chromium"/* "${pkgdir}/usr/share/${pkgname}/"
}
sha256sums=('e40d2195be6d42a31d0698952cfb78da62ecad2731c2218868d69f776241308a')

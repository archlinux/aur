# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=chromium-extension-adnauseam
pkgver=3.9.200
_pkgver=3.9.2
pkgrel=1
pkgdesc='An ad-blocker which silently simulates clicks on each blocked ad, confusing trackers'
arch=('any')
url='https://adnauseam.io'
license=('GPL3')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install=${pkgname}.install
source=("https://github.com/dhowe/AdNauseam/releases/download/v${pkgver}/adnauseam-${_pkgver}.chromium.zip")

package() {
   mkdir -p "${pkgdir}/usr/share/${pkgname}"
   cp -dr --no-preserve=ownership "${srcdir}/adnauseam.chromium"/* "${pkgdir}/usr/share/${pkgname}/"
}
sha256sums=('8baede13bc03e9dc9ddc4c6293296c7a9112d1d5264a4c7cd0c51d5cd4a7cddc')
b2sums=('5dad0488bbf99899887117e7c481c60e17257097776159c7918f07305828f1d26cfc982dcb3f487c8c809ea729ccd6dfed4db5985e8871b77d3ae401c07226ac')

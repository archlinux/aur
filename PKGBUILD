# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=chromium-extension-adnauseam
pkgver=3.9.103
pkgrel=1
pkgdesc='An ad-blocker which silently simulates clicks on each blocked ad, confusing trackers'
arch=('any')
url='https://adnauseam.io'
license=('GPL3')
makedepends=('zip')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install=${pkgname}.install
source=("https://github.com/dhowe/AdNauseam/releases/download/v${pkgver}/adnauseam-${pkgver}.chromium.zip")

package() {
   mkdir -p "${pkgdir}/usr/share/${pkgname}"
   cp -dr --no-preserve=ownership "${srcdir}/adnauseam.chromium"/* "${pkgdir}/usr/share/${pkgname}/"
}
b2sums=('117d9a9ce57e0684bf5c8f01babec9c70c8fb0ebce3426d61c2374a30a1cf5bd31bd053b223df0df46f1077478ae3371219195899477947ac08fbceba0948a0c')

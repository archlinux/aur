# Maintainer: Yurii <yu hrysh at proton mail dot com>

pkgname=chromium-extension-adnauseam
pkgver=3.8.302
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
sha256sums=('e96564a6013a41467ca79e4a9df418dd47c76b3ad45d0dc35ac44c1c33bee035')

package() {
   mkdir -p "${pkgdir}/usr/share/${pkgname}"
   cp -dr --no-preserve=ownership "${srcdir}/adnauseam.chromium"/* "${pkgdir}/usr/share/${pkgname}/"
}

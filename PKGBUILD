# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=chromium-extension-adnauseam
pkgver=3.9.107
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
sha256sums=('13506528d6fab3a5665ed09213a35317f7764e2f1169499f0cda425ef67133b9')
b2sums=('20d2ec141b9a75cb7e7b06da437d35152f2d423a0a71fec5f87d378697ce0965b06562ed152a30884ba1757580cb87c2325cace1adcfc1ef1a85c4f096805f56')

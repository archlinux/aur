# Maintainer: oatmealraisin <archlinux at oatmealrais dot in>

pkgname=firefox-extension-sponsorblock-beta
pkgver=5.10.3
pkgrel=1
pkgdesc='Easily skip YouTube video sponsors.'
arch=(any)
url=https://github.com/ajayyy/SponsorBlock
license=(GPL-3.0-only)
depends=(
  firefox
)
conflicts=(
  firefox-sponsorblock-for-youtube-skip-sponsorships-bin
)
source=("${pkgname}-${pkgver}.xpi::https://github.com/ajayyy/SponsorBlock/releases/download/${pkgver}/FirefoxSignedInstaller.xpi")
b2sums=("13063c90a4a5b62341a8ee3fdd6a100d29925cfe0d76334aa24171e0716f595712295930a440dba1395884281cd2e28a86525cc1eb49309e8ab3e7f06d8b3ea5")

package() {
  install -Dm644 ${pkgname}-${pkgver}.xpi \
    "$pkgdir"/usr/lib/firefox/browser/extensions/sponsorBlockerBETA@ajay.app.xpi
}

# vim: ts=2 sw=2 et:

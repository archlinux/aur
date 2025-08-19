# Maintainer: oatmealraisin <archlinux at oatmealrais dot in>

pkgname=firefox-extension-sponsorblock-beta
pkgver=5.14
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
b2sums=('699f08d167c64b235e72ca435778c8a38f54da3331b8b7664fe5af4968250178e2c7a6cae5fde33f1e5c8f6b93d1cb9b9b19cb4ed1fb3a50845f736568235733')

package() {
  install -Dm644 ${pkgname}-${pkgver}.xpi \
    "$pkgdir"/usr/lib/firefox/browser/extensions/sponsorBlockerBETA@ajay.app.xpi
}

# vim: ts=2 sw=2 et:

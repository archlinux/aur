# Maintainer: Pollis <hello@pollis.com>
# To regenerate .SRCINFO after updating this file, run:
#   makepkg --printsrcinfo > .SRCINFO

pkgname=pollis
pkgver=1.0.147
pkgrel=1
pkgdesc="End-to-end encrypted messaging"
arch=('x86_64')
url="https://pollis.com"
license=('LicenseRef-proprietary')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libayatana-appindicator'
  'alsa-lib'
  'libpulse'
  'dbus'
)
source=("https://cdn.pollis.com/releases/v${pkgver}/pollis-v${pkgver}-linux.deb")
sha256sums=('89f661e93d76f2db2cf2c9e2c11e8c1810b1805c491e01f4782323503cd5a56b')

package() {
  # Extract the data archive from the .deb
  bsdtar -xf data.tar.* -C "${pkgdir}/"
}

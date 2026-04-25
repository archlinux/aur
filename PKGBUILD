# Maintainer: Pollis <hello@pollis.com>
# To regenerate .SRCINFO after updating this file, run:
#   makepkg --printsrcinfo > .SRCINFO

pkgname=pollis
pkgver=1.0.120
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
sha256sums=('a484634b1a945f3c828581830d435b0e8fdfb4020817d61e393fca72d736fda3')

package() {
  # Extract the data archive from the .deb
  bsdtar -xf data.tar.* -C "${pkgdir}/"
}

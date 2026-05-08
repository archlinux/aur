# Maintainer: Pollis <hello@pollis.com>
# To regenerate .SRCINFO after updating this file, run:
#   makepkg --printsrcinfo > .SRCINFO

pkgname=pollis
pkgver=1.0.136
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
sha256sums=('06759b564dc335be7c00740a52106d41ee004045b2c7b321f0a06e520009d81d')

package() {
  # Extract the data archive from the .deb
  bsdtar -xf data.tar.* -C "${pkgdir}/"
}

# Maintainer: Pollis <hello@pollis.com>
# To regenerate .SRCINFO after updating this file, run:
#   makepkg --printsrcinfo > .SRCINFO

pkgname=pollis
pkgver=1.0.164
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
sha256sums=('c8c8324bc48140f9f4ac9fd8d8cdb4d965aa34c53d83a323dbe5c087309f8e5f')

package() {
  # Extract the data archive from the .deb
  bsdtar -xf data.tar.* -C "${pkgdir}/"
}

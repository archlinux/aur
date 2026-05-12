# Maintainer: Pollis <hello@pollis.com>
# To regenerate .SRCINFO after updating this file, run:
#   makepkg --printsrcinfo > .SRCINFO

pkgname=pollis
pkgver=1.0.144
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
sha256sums=('51a88d03f6fd0cd8467b1900e8cda6c936ef91301e04637824ffcfc316866a38')

package() {
  # Extract the data archive from the .deb
  bsdtar -xf data.tar.* -C "${pkgdir}/"
}

# Maintainer: Arnav Gupta <allenarnav2023@gmail.com>
pkgname=soundkeeper-linux
pkgver=1.0
pkgrel=1
pkgdesc="Keeps audio devices alive by playing an inaudible 19kHz tone via SoX."
arch=('any')
url="https://github.com/yourusername/soundkeeper-linux" # Or your local path
license=('MIT')
depends=('sox')
source=("soundkeeper.service")
sha256sums=('SKIP') # Replace with actual hash for security if publishing

package() {
  # Install the systemd user service
  install -Dm644 "${srcdir}/soundkeeper.service" "${pkgdir}/usr/lib/systemd/user/soundkeeper.service"
}

# Maintainer: Arnav Gupta <allenarnav2023@gmail.com>
pkgname=soundkeeper-linux
pkgver=1.0
pkgrel=1
pkgdesc="Keeps audio devices alive by playing an inaudible 19kHz tone via SoX."
arch=('any')
url="https://github.com/arnav4o4/soundkeeper-linux" # Or your local path
license=('MIT')
depends=('sox')
source=("soundkeeper.service")
sha256sums=('a6ccc7d9ea0ea384b6a8c56d15703b05d8747e53f114210e3f60bb56de24d524')

package() {
  # Install the systemd user service
  install -Dm644 "${srcdir}/soundkeeper.service" "${pkgdir}/usr/lib/systemd/user/soundkeeper.service"
}

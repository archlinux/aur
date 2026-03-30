# Maintainer: VirGuaZ <virguaz@proton.me>

# NOTE: Binance does not provide versioned download URLs.
# Version is verified via sha256sum against the official release.

pkgname=binance-desktop
pkgver=2.2.1
pkgrel=1
pkgdesc="Official Binance desktop application"
arch=('x86_64')
url="https://www.binance.com"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxtst')
source=("binance-${pkgver}.deb::https://ftp.binance.com/electron-desktop/linux/production/binance-amd64-linux.deb")
sha256sums=('25cf4c8b76a56cbf879479bf2844e674078dea9cca3f0c72789f8c18bcb59a08')

package() {
  cd "${srcdir}"
  bsdtar -xf data.tar.* -C "${pkgdir}"
}

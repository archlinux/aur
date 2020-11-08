# Maintainer: robertfoster

pkgname=librespeaker-bin
pkgver=2.1.2.190110
pkgrel=1
pkgdesc="An audio processing library which can perform noise suppression, beamforming, echo cancellation, direction of arrival calculation, hotword searching, etc."
arch=('armv6h' 'armv7h' 'aarch64')
url="https://github.com/Seeed-Studio/pi_repo"
license=('PROPRIETARY')
depends=('libpulse')
provides=('librespeaker')
conflicts=('librespeaker')
install=
source=("https://github.com/M0Rf30/librespeaker-bin/archive/$pkgver.tar.gz")

package() {
  cd "$pkgname-$pkgver"
  cp -r * "$pkgdir"
}

md5sums=('6b5a1d60215f2dec4235dee6a6f4f57e')

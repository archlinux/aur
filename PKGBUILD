# Maintainer: robertfoster

pkgname=librespeaker-bin
pkgver=2.1.2.190110
pkgrel=1
pkgdesc="An audio processing library which can perform noise suppression, beamforming, echo cancellation, direction of arrival calculation, hotword searching, etc."
arch=('armv6h' 'armv7h' 'aarch64')
url="https://github.com/Seeed-Studio/pi_repo"
license=('PROPRIETARY')
depends=('fftw' 'libpulse' 'libpulse' 'libsndfile')
provides=('librespeaker')
conflicts=('librespeaker')
install=
source=("https://github.com/M0Rf30/librespeaker-bin/archive/$pkgver.tar.gz")

package() {
  cd "$pkgname-$pkgver"
  cp -r * "$pkgdir"
  chmod +x $pkgdir/usr/lib/*.so.*
}

sha256sums=('f6d39ad0635632677c822b7010cc26658be397f2c04545d325e2e5c2df249ff9')

# Maintainer: Laurent Le Houerou <laurent@lehouerou.net>
pkgname=waves-bin
pkgver=0.1.20
pkgrel=1
pkgdesc="Terminal music player with library browsing and queue management"
arch=('x86_64')
url="https://github.com/llehouerou/waves"
license=('GPL-3.0-only')
depends=('alsa-lib')
provides=('waves')
conflicts=('waves')
source=("https://github.com/llehouerou/waves/releases/download/v$pkgver/waves_${pkgver}_linux_amd64.tar.gz")
sha256sums=('0cf06d33c3772743df16a796e34aded55936e5b2c7d499ad6004794a68f95679')

package() {
    install -Dm755 waves "$pkgdir/usr/bin/waves"
}

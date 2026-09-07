# Maintainer: Laurent Le Houerou <laurent@lehouerou.net>
pkgname=waves-bin
pkgver=0.1.47
pkgrel=1
pkgdesc="Terminal music player with library browsing and queue management"
arch=('x86_64')
url="https://github.com/llehouerou/waves"
license=('GPL-3.0-only')
depends=('alsa-lib')
provides=('waves')
conflicts=('waves')
source=("https://github.com/llehouerou/waves/releases/download/v$pkgver/waves_${pkgver}_linux_amd64.tar.gz")
sha256sums=('6c4848a2457b96b7cd345bffd3e100aa68609a553d5e3099a5f01c33e330093b')

package() {
    install -Dm755 waves "$pkgdir/usr/bin/waves"
}

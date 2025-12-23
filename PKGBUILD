# Maintainer: Laurent Le Houerou <laurent@lehouerou.net>
pkgname=waves-bin
pkgver=0.1.25
pkgrel=1
pkgdesc="Terminal music player with library browsing and queue management"
arch=('x86_64')
url="https://github.com/llehouerou/waves"
license=('GPL-3.0-only')
depends=('alsa-lib')
provides=('waves')
conflicts=('waves')
source=("https://github.com/llehouerou/waves/releases/download/v$pkgver/waves_${pkgver}_linux_amd64.tar.gz")
sha256sums=('877d50c3b95c891e9e1b7475918bed106be00a49ffa58b442f4563d311529712')

package() {
    install -Dm755 waves "$pkgdir/usr/bin/waves"
}

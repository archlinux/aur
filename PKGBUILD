# Maintainer: Laurent Le Houerou <laurent@lehouerou.net>
pkgname=waves-bin
pkgver=0.1.23
pkgrel=1
pkgdesc="Terminal music player with library browsing and queue management"
arch=('x86_64')
url="https://github.com/llehouerou/waves"
license=('GPL-3.0-only')
depends=('alsa-lib')
provides=('waves')
conflicts=('waves')
source=("https://github.com/llehouerou/waves/releases/download/v$pkgver/waves_${pkgver}_linux_amd64.tar.gz")
sha256sums=('091b6e5c8855aa9bfa9c94ab4417657fd601187354f256591c83f2417af4fc10')

package() {
    install -Dm755 waves "$pkgdir/usr/bin/waves"
}

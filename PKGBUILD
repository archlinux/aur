# Maintainer: Laurent Le Houerou <laurent@lehouerou.net>
pkgname=waves-bin
pkgver=0.1.37
pkgrel=1
pkgdesc="Terminal music player with library browsing and queue management"
arch=('x86_64')
url="https://github.com/llehouerou/waves"
license=('GPL-3.0-only')
depends=('alsa-lib')
provides=('waves')
conflicts=('waves')
source=("https://github.com/llehouerou/waves/releases/download/v$pkgver/waves_${pkgver}_linux_amd64.tar.gz")
sha256sums=('3513d93cf303c67fdf5f2ccb65f0dd6b6bbf4e11d63b248a92f9ca148f4590cf')

package() {
    install -Dm755 waves "$pkgdir/usr/bin/waves"
}

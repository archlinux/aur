# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=agntz
pkgver=0.3.0
pkgrel=1
pkgdesc="Agent utility toolkit for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/agntz"
license=('MIT')
depends=('gcc-libs')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/agntz/releases/download/v$pkgver/agntz-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/agntz/releases/download/v$pkgver/agntz-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('db3e9133ebc805cc17ee20c4edd746737e3cad5fd42f707f050d2b248dd484dc')
sha256sums_aarch64=('795e9e0dee90b5b9bac9f833edf1ea5d0cc03fdcaf7e33ae8bc1400039e8fbca')

package() {
    install -Dm755 agntz "$pkgdir/usr/bin/agntz"
}

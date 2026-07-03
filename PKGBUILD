# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=agntz
pkgver=0.3.2
pkgrel=1
pkgdesc="Agent utility toolkit for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/agntz"
license=('MIT')
depends=('gcc-libs')
source_x86_64=("agntz-0.3.2-x86_64.tar.gz::https://github.com/byteowlz/agntz/releases/download/v0.3.2/agntz-v0.3.2-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('2ee5b9148f1a3976f1b011767cc5c0931d53332570aa79881ab5badb0e375994')
source_aarch64=("agntz-0.3.2-aarch64.tar.gz::https://github.com/byteowlz/agntz/releases/download/v0.3.2/agntz-v0.3.2-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('dd18383e9a3d9d7e5f325a4c075c4ed168240a8d2682f4f33af7ecf3c5a495df')

package() {
    cd "$srcdir"
    install -Dm755 */bin/agntz "$pkgdir/usr/bin/agntz"
}

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
sha256sums_x86_64=('b8d6530296fb7cb3e00532fc307fdfee6949006ff53aacb173754656051c45b5')
sha256sums_aarch64=('6e359a7e6f291a077f5380e4333d8bd0894043a2b7dcfc92ad58fcdda77797aa')

package() {
    install -Dm755 agntz "$pkgdir/usr/bin/agntz"
}

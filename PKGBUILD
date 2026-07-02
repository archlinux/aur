# Maintainer: Thomas Pellissier-Tanon <thomas at pellissier-tanon dot fr>

pkgname=codspeed-bin
pkgver=4.18.1
pkgrel=1
pkgdesc="codspeed test runner"
arch=('x86_64')
url="https://github.com/CodSpeedHQ/codspeed"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc' 'openssl' 'lsb-release' 'valgrind-codspeed')
source=("codspeed-runner-x86_64-unknown-linux-musl.tar.gz::https://github.com/CodSpeedHQ/codspeed/releases/download/v${pkgver//_/-}/codspeed-runner-x86_64-unknown-linux-musl.tar.gz")
sha512sums=('422270d03fc69fe599dd9ac048d869d31b5dd8da7c248fe466c161b9246761aadd0e71d10c7fae3d5c1be38d759eef6784317c73d3344c6031ac170587a2b062')

package() {
    install -Dm755 "codspeed-runner-x86_64-unknown-linux-musl/codspeed" "$pkgdir/usr/bin/codspeed"
    install -Dm644 "codspeed-runner-x86_64-unknown-linux-musl/LICENSE-APACHE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 "codspeed-runner-x86_64-unknown-linux-musl/LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

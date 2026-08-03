# Maintainer: Thomas Pellissier-Tanon <thomas at pellissier-tanon dot fr>

pkgname=codspeed-bin
pkgver=5.6.3
pkgrel=1
pkgdesc="codspeed test runner"
arch=('x86_64')
url="https://github.com/CodSpeedHQ/codspeed"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc' 'openssl' 'lsb-release' 'valgrind-codspeed')
source=("codspeed-runner-x86_64-unknown-linux-musl.tar.gz::https://github.com/CodSpeedHQ/codspeed/releases/download/v${pkgver//_/-}/codspeed-runner-x86_64-unknown-linux-musl.tar.gz")
sha512sums=('bbd802b6e657fc4f6cabf238be06de57781dd01b01874edef6aadd30abaa75511f89facbb66d3ae4071043345320e9798e5cecb8794f2859bb70dff13d87c593')

package() {
    install -Dm755 "codspeed-runner-x86_64-unknown-linux-musl/codspeed" "$pkgdir/usr/bin/codspeed"
    install -Dm644 "codspeed-runner-x86_64-unknown-linux-musl/LICENSE-APACHE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 "codspeed-runner-x86_64-unknown-linux-musl/LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

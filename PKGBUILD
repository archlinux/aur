# Maintainer: Iakov Salikov <me@isalikov.com>
pkgname=radio-record-cli
pkgver=1.1.1
pkgrel=1
pkgdesc="Terminal radio player for Radio Record stations"
arch=('x86_64' 'aarch64')
url="https://github.com/isalikov/radio-record-cli"
license=('MIT')
depends=('mpv')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/isalikov/$pkgname/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/isalikov/$pkgname/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm755 radio-record "$pkgdir/usr/bin/radio-record"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=emailctl-bin
pkgver=0.1.2
pkgrel=2
pkgdesc='Rust email CLI with Gmail OAuth and generic IMAP/SMTP support'
arch=(x86_64)
url='https://github.com/LIghtJUNction/emailctl'
license=('MIT OR Apache-2.0')
provides=(emailctl)
conflicts=(emailctl)
depends=(openssl)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/emailctl-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('827132bdb1574bfe71a040c48faa331c1b7bb197b19463fc9a4c068f7ad0b1e4')

package() {
    cd "emailctl-$pkgver-$CARCH-unknown-linux-gnu"
    install -Dm755 email -t "$pkgdir/usr/bin/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}


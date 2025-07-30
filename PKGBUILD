# Maintainer: Keiran <keiran@keircn.com>
pkgname=karu
pkgver=0.1.2
pkgrel=1
pkgdesc="A command-line tool for downloading and watching anime"
arch=('x86_64')
url="https://github.com/keircn/karu"
license=('MIT')
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/keircn/karu/releases/download/v$pkgver/karu-linux-amd64.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/karu-linux-amd64" "$pkgdir/usr/bin/karu"
}

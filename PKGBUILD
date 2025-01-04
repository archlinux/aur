# Maintainer: Keiran <me@keiran.cc>

pkgname=slopr
pkgver=1.0.0
pkgrel=1
pkgdesc="A Go-based client for the slop.sh API"
arch=('x86_64')
url="https://github.com/keirim/slopr"
license=('MIT')
depends=('glibc')
source=("https://github.com/keirim/slopr/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir"
    install -Dm755 "$srcdir/$pkgname-$pkgver/slopr" "$pkgdir/usr/bin/$pkgname"
}

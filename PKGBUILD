pkgname=powerpipe-bin
pkgver=1.5.1
pkgrel=1
pkgdesc='Powerpipe'
url='https://github.com/turbot/powerpipe'
license=('AGPL-3.0-only')
arch=('x86_64')
provides=('powerpipe')
depends=('gcc-libs' 'glibc')
source=("powerpipe-$pkgver-$pkgrel.tgz::https://github.com/turbot/powerpipe/releases/download/v$pkgver/powerpipe.linux.amd64.tar.gz")
sha256sums=('29d1458a20df296de80ebe6eb24f59afcac09a806982fdaa6fef1ed9be0eee7f')

package() {
    tar xzf $srcdir/powerpipe-$pkgver-$pkgrel.tgz
    install -Dm 755 "$srcdir/powerpipe" "$pkgdir/usr/bin/powerpipe"
}

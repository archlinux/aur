pkgname=powerpipe-bin
pkgver=1.5.5
pkgrel=1
pkgdesc='Powerpipe'
url='https://github.com/turbot/powerpipe'
license=('AGPL-3.0-only')
arch=('x86_64')
provides=('powerpipe')
depends=('gcc-libs' 'glibc')
source=("powerpipe-$pkgver-$pkgrel.tgz::https://github.com/turbot/powerpipe/releases/download/v$pkgver/powerpipe.linux.amd64.tar.gz")
sha256sums=('9d834c95a73790ed4a1307eac97095ff762b0b7dbe507d8676e891dacde384c6')

package() {
    tar xzf $srcdir/powerpipe-$pkgver-$pkgrel.tgz
    install -Dm 755 "$srcdir/powerpipe" "$pkgdir/usr/bin/powerpipe"
}

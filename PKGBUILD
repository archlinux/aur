pkgname=powerpipe-bin
pkgver=1.5.9
pkgrel=1
pkgdesc='Powerpipe'
url='https://github.com/turbot/powerpipe'
license=('AGPL-3.0-only')
arch=('x86_64')
provides=('powerpipe')
depends=('gcc-libs' 'glibc')
source=("powerpipe-$pkgver-$pkgrel.tgz::https://github.com/turbot/powerpipe/releases/download/v$pkgver/powerpipe.linux.amd64.tar.gz")
sha256sums=('711816dafe180e16f7dbb67d49787f0780f9b7d1e658a40802e83f52af27241e')

package() {
    tar xzf $srcdir/powerpipe-$pkgver-$pkgrel.tgz
    install -Dm 755 "$srcdir/powerpipe" "$pkgdir/usr/bin/powerpipe"
}

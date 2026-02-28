pkgname=powerpipe-bin
pkgver=1.5.0
pkgrel=1
pkgdesc='Powerpipe'
url='https://github.com/turbot/powerpipe'
license=('AGPL-3.0-only')
arch=('x86_64')
provides=('powerpipe')
depends=('gcc-libs' 'glibc')
source=("powerpipe-$pkgver-$pkgrel.tgz::https://github.com/turbot/powerpipe/releases/download/v$pkgver/powerpipe.linux.amd64.tar.gz")
sha256sums=('e2cd16551ae7b4218a2a0abdfa6f006718c7dd9a3ace6e58c2da263e7d642e55')

package() {
    tar xzf $srcdir/powerpipe-$pkgver-$pkgrel.tgz
    install -Dm 755 "$srcdir/powerpipe" "$pkgdir/usr/bin/powerpipe"
}

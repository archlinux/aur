pkgname=powerpipe-bin
pkgver=1.4.1
pkgrel=1
pkgdesc='Powerpipe'
url='https://github.com/turbot/powerpipe'
license=('AGPL-3.0-only')
arch=('x86_64')
provides=('powerpipe')
depends=('gcc-libs' 'glibc')
source=("powerpipe-$pkgver-$pkgrel.tgz::https://github.com/turbot/powerpipe/releases/download/v$pkgver/powerpipe.linux.amd64.tar.gz")
sha256sums=('e698124de67c6bc1328a61e919d77d1322e22818c0216f92bddb680cf4ce98b7')

package() {
    tar xzf $srcdir/powerpipe-$pkgver-$pkgrel.tgz
    install -Dm 755 "$srcdir/powerpipe" "$pkgdir/usr/bin/powerpipe"
}

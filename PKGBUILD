# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=steampipe-bin
pkgver=0.9.1
pkgrel=2
pkgdesc='Steampipe CLI'
url='https://github.com/turbot/steampipe'
license=('AGPL-3.0')
arch=('x86_64')
provides=('steampipe')
source=("steampipe-$pkgver-$pkgrel.tgz::https://github.com/turbot/steampipe/releases/download/v$pkgver/steampipe_linux_amd64.tar.gz")
sha256sums=('a26a9439b686c658c547db508af5c1187781eb3014964f3f312ab94042480cfa')

package() {
    tar xzf $srcdir/steampipe-$pkgver-$pkgrel.tgz
    install -Dm 755 "$srcdir/steampipe" "$pkgdir/usr/bin/steampipe"
}

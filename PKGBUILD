# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=steampipe-bin
pkgver=0.15.1
pkgrel=1
pkgdesc='Steampipe CLI'
url='https://github.com/turbot/steampipe'
license=('AGPL-3.0')
arch=('x86_64')
provides=('steampipe')
source=("steampipe-$pkgver-$pkgrel.tgz::https://github.com/turbot/steampipe/releases/download/v$pkgver/steampipe_linux_amd64.tar.gz")
sha256sums=('9cb32c6f1f26a23b0a81829ccbc9a37522f9c7f05fd98e30c08d9729e43fc4d1')

package() {
    tar xzf $srcdir/steampipe-$pkgver-$pkgrel.tgz
    install -Dm 755 "$srcdir/steampipe" "$pkgdir/usr/bin/steampipe"
}

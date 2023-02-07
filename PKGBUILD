# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=steampipe-bin
pkgver=0.18.5
pkgrel=1
pkgdesc='Steampipe CLI'
url='https://github.com/turbot/steampipe'
license=('AGPL-3.0')
arch=('x86_64')
provides=('steampipe')
source=("steampipe-$pkgver-$pkgrel.tgz::https://github.com/turbot/steampipe/releases/download/v$pkgver/steampipe_linux_amd64.tar.gz")
sha256sums=('a7f8b67a7b4b1bc95afb5cfcdd1a4bee945fb5449aed14b14af1ee38b56452e7')

package() {
    tar xzf $srcdir/steampipe-$pkgver-$pkgrel.tgz
    install -Dm 755 "$srcdir/steampipe" "$pkgdir/usr/bin/steampipe"
}

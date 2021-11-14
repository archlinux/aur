# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=steampipe-bin
pkgver=0.9.1
pkgrel=3
pkgdesc='Steampipe CLI'
url='https://github.com/turbot/steampipe'
license=('AGPL-3.0')
arch=('x86_64')
provides=('steampipe')
source=("steampipe-$pkgver-$pkgrel.tgz::https://github.com/turbot/steampipe/releases/download/v$pkgver/steampipe_linux_amd64.tar.gz")
sha256sums=('692889cc226dae2eb4687bca850374cfa2dd79814fba2f529242d0d48fe8b9fd')

package() {
    tar xzf $srcdir/steampipe-$pkgver-$pkgrel.tgz
    install -Dm 755 "$srcdir/steampipe" "$pkgdir/usr/bin/steampipe"
}

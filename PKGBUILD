# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=steampipe-bin
pkgver=0.18.2
pkgrel=1
pkgdesc='Steampipe CLI'
url='https://github.com/turbot/steampipe'
license=('AGPL-3.0')
arch=('x86_64')
provides=('steampipe')
source=("steampipe-$pkgver-$pkgrel.tgz::https://github.com/turbot/steampipe/releases/download/v$pkgver/steampipe_linux_amd64.tar.gz")
sha256sums=('c1127ecd4b69d8066986de40317803426c4b56d1ae6d19fb5cbf5b95e97a3b88')

package() {
    tar xzf $srcdir/steampipe-$pkgver-$pkgrel.tgz
    install -Dm 755 "$srcdir/steampipe" "$pkgdir/usr/bin/steampipe"
}

# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=gw2-tools
pkgver=4
pkgrel=1
pkgdesc="Collection of small Guild Wars 2 tools"
arch=(any)
url=http://ikn.org.uk/gw2-tools
license=(BSD)
depends=(curl jshon parallel wget)
optdepends=('p7zip: gw2-dpsreport: support non-Zip logs, compress before upload')
source=("http://ikn.org.uk/files/desktop/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('0324fd6f5cc0dde77e1c03933efebe44cc39e85d')

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -D LICENSE "$pkgdir"/usr/share/licenses/gw2-tools/LICENSE
}

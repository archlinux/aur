# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=gw2-tools
pkgver=1
pkgrel=1
pkgdesc="Collection of small Guild Wars 2 tools"
arch=(any)
url=http://ikn.org.uk/gw2-tools
license=(BSD)
depends=(curl jshon)
source=("http://ikn.org.uk/files/desktop/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('30a9cfce0be2d104fde218d0c0a59196df79a8d4')

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -D LICENSE "$pkgdir"/usr/share/licenses/gw2-tools/LICENSE
}

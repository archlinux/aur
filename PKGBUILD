# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=gw2-tools
pkgver=3
pkgrel=1
pkgdesc="Collection of small Guild Wars 2 tools"
arch=(any)
url=http://ikn.org.uk/gw2-tools
license=(BSD)
depends=(curl jshon parallel)
optdepends=('p7zip: support non-Zip logs, compress before upload')
source=("http://ikn.org.uk/files/desktop/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('1053e4f18c85b08ebd0e3e4d93596cd306798dcf')

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -D LICENSE "$pkgdir"/usr/share/licenses/gw2-tools/LICENSE
}

# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=tvheadend-safe-restart
pkgver=1.0
pkgrel=1
pkgdesc="Restart Tvheadend unless it's recording"
arch=(any)
url=http://ikn.org.uk/tool/tvheadend-safe-restart
license=(BSD)
depends=(jshon)
source=("http://ikn.org.uk/download/tool/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('d6d28c44026de7d74ec2ec425b1e2a73dd087856')

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install
    install -D LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

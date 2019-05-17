# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=ytsubs
pkgver=0.3.2
pkgrel=1
pkgdesc="Make an RSS feed from YouTube subscriptions"
arch=(any)
url='http://ikn.org.uk/Scripts#ytsubs'
license=(GPL3)
depends=("python>=3.2")
source=(http://ikn.org.uk/files/scripts/$pkgname)
md5sums=('b422b27b393952e2b5dc5f73d333dea5')

package () {
    mkdir -p "$pkgdir/usr/bin/"
    install -m755 "$srcdir/$pkgname" "$pkgdir/usr/bin/"
}

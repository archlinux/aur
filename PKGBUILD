# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=ytsubs
pkgver=0.3.3
pkgrel=1
pkgdesc="Make an RSS feed from YouTube subscriptions"
arch=(any)
url='http://ikn.org.uk/Scripts#ytsubs'
license=(GPL3)
depends=("python>=3.2")
source=(http://ikn.org.uk/files/scripts/$pkgname)
sha1sums=('07d02c095f11a0656ccc0cfcdc8359579512b044')

package () {
    mkdir -p "$pkgdir/usr/bin/"
    install -m755 "$srcdir/$pkgname" "$pkgdir/usr/bin/"
}

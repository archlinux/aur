# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=ytsubs
pkgver=0.3.4
pkgrel=1
pkgdesc="Make an RSS feed from YouTube subscriptions"
arch=(any)
url='http://ikn.org.uk/tool/scripts#ytsubs'
license=(GPL3)
depends=("python>=3.2")
source=(http://ikn.org.uk/download/tool/$pkgname)
sha1sums=('a7d38a423b3339e6396bfc462a505f50d8ac562e')

package () {
    mkdir -p "$pkgdir/usr/bin/"
    install -m755 "$srcdir/$pkgname" "$pkgdir/usr/bin/"
}

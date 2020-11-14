# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=ytsubs
pkgver=0.3.5
pkgrel=1
pkgdesc="Make an RSS feed from YouTube subscriptions"
arch=(any)
url='http://ikn.org.uk/tool/scripts#ytsubs'
license=(GPL3)
depends=("python>=3.2")
source=(http://ikn.org.uk/download/tool/$pkgname)
sha1sums=('585c21089d46a192566381661487cd1e436cf83e')

package () {
    mkdir -p "$pkgdir/usr/bin/"
    install -m755 "$srcdir/$pkgname" "$pkgdir/usr/bin/"
}

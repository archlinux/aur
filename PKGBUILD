# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=ytsubs
pkgver=0.3.0
pkgrel=1
pkgdesc="Make an RSS feed from YouTube subscriptions"
arch=(any)
url='http://ikn.org.uk/Scripts#ytsubs'
license=(GPL3)
depends=("python>=3.2")
source=(http://ikn.org.uk/files/scripts/$pkgname)
md5sums=('39f923db3818e11fa45ebeb8d8723eec')

package () {
    mkdir -p "$pkgdir/usr/bin/"
    install -m755 "$srcdir/$pkgname" "$pkgdir/usr/bin/"
}

# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=ytsubs
pkgver=0.2.7
pkgrel=1
pkgdesc="Make an RSS feed from YouTube subscriptions"
arch=(any)
url='http://ikn.org.uk/Scripts#ytsubs'
license=(GPL3)
depends=(python2-gdata)
source=(http://ikn.org.uk/files/scripts/$pkgname
        .AURINFO)
md5sums=('080ab22c4042421c624018ac0d165816'
         '15b6ccb7be3f009f212c15f640a8a91f')

package () {
    mkdir -p "$pkgdir/usr/bin/"
    install -m755 "$srcdir/$pkgname" "$pkgdir/usr/bin/"
}

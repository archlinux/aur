# Contributor: Alex Charrett arch at transposed dot org
pkgname=cdpr
pkgver=2.4
pkgrel=3
pkgdesc="cdpr is used to decode a Cisco Disovery Protocol (CDP) packet"
url="http://sourceforge.net/projects/cdpr"
license="GPL"
arch=(i686 x86_64)
source=(http://heanet.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tgz)
md5sums=('ee0f112e1a914168d088e4e0291efbcb')

package() {
    cd $srcdir/$pkgname-$pkgver
    make || return 1
    mkdir -p $pkgdir/usr/bin
    install -m 755 $srcdir/$pkgname-$pkgver/cdpr $pkgdir/usr/bin || return 1
}



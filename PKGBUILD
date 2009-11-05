# Maintainer: Mikko Seppälä <t-r-a-y@mbnet.fi>
# Licence in pcre pkg

_pkgsourcename=pcre
pkgname=lib32-$_pkgsourcename
pkgver=8.00
pkgrel=1
pkgdesc="A library that implements Perl 5-style regular expressions"
arch=('x86_64')
url="http://pcre.sourceforge.net"
license=('custom')
groups=('lib32')
depends=('lib32-gcc')
source=(ftp://ftp.archlinux.org/core/os/i686/$_pkgsourcename-$pkgver-$pkgrel-i686.pkg.tar.gz)

build() {
        cd $srcdir
        mkdir -p $pkgdir/opt/lib32/lib
        cp -dp lib/*.so* $pkgdir/opt/lib32/lib
}
md5sums=('f60cf2d208573ed59654f1516fd4487c')

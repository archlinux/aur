# Maintainer: Ionut Biru <ionut@archlinux.ro>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>
# Licence in pcre pkg

_pkgsourcename=pcre
pkgname=lib32-$_pkgsourcename
pkgver=8.02
pkgrel=1
pkgdesc="A library that implements Perl 5-style regular expressions"
arch=('x86_64')
url="http://pcre.sourceforge.net"
license=('custom')
groups=('lib32')
depends=('lib32-gcc')
source=(ftp://ftp.archlinux.org/core/os/i686/$_pkgsourcename-$pkgver-$pkgrel-i686.pkg.tar.xz)

build() {
        cd $srcdir
        mkdir -p $pkgdir/opt/lib32/lib
        cp -dp lib/*.so* $pkgdir/opt/lib32/lib
}
md5sums=('899f78dd52e907d38062bc0dbf4ea6e9')
sha256sums=('cf4a1a5b22007870979b42c543053efee50d49dc1718928f79e4887763d9bce0')

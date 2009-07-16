# Maintainer: Mikko Seppälä <t-r-a-y@mbnet.fi>
# Licence in pcre pkg

_pkgsourcename=pcre
pkgname=lib32-$_pkgsourcename
pkgver=7.9
pkgrel=1
pkgdesc="A library that implements Perl 5-style regular expressions"
arch=(x86_64)
url="http://pcre.sourceforge.net"
license=('custom')
groups=('lib32')
depends=('lib32-gcc')
source=(ftp://ftp.archlinux.org/core/os/i686/$_pkgsourcename-$pkgver-$pkgrel-i686.pkg.tar.gz)
md5sums=('493963c406cdfa0d421532676e423f63')

build() {
        cd $startdir/src
        mkdir -p $startdir/pkg/opt/lib32/lib
        cp -dp lib/*.so* $startdir/pkg/opt/lib32/lib
}

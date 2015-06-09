# Maintainer: James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=msjnc
pkgver=2.5
pkgrel=1
pkgdesc="MadScientist's JNC Session Manager"
arch=('x86_64')
url="https://github.com/madscientist/msjnc"
license=()
depends=('gtk2-perl'
         'glib-perl'
         'unzip'
		 'lib32-zlib'
		 'net-tools'
		 'glib-perl'
		 'perl-libwww')
source=(https://raw.github.com/madscientist/msjnc/master/msjnc)
md5sums=('553ddad65b7c591b8e3b591846bafecd')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -m 755 ${srcdir}/msjnc ${pkgdir}/usr/bin/
}


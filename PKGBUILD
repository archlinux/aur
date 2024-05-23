# Maintainer: Sterophonick
pkgname=devkitadv
_pkgname='devkitadv'
pkgver=r4-linux
pkgrel=1
pkgdesc="Jason Wilkins' Game Boy Advance SDK (GCC 3.1)"
url='https://sourceforge.net/projects/devkitadv/'
arch=(x86_64 i686)
makedepends=(p7zip)
source=(https://master.dl.sourceforge.net/project/devkitadv/Linux/Release%204/devkitadv.tar.bz2)
md5sums=('03f107b3decff9238572f90939c4b16b')
license=('nonfree')
options=(!debug !strip)

package() {
  cd $srcdir

  mkdir -p $pkgdir/opt/
  cp -r devkitadv $pkgdir/opt/
  chmod -R 777 $pkgdir/opt/devkitadv
}

post_install() {
  echo "Make sure you set \$DEVKITADV = /opt/devkitadv in your environment."
}

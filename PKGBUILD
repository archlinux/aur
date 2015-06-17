# Maintainer: M0Rf30

pkgname=bootinfoscript
pkgver=0.61
pkgrel=1
pkgdesc="A script which searches all hard drives attached to the computer for information related to booting."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/bootinfoscript/"
license=('MIT')
depends=('bash')
source=(http://prdownloads.sourceforge.net/bootinfoscript/bootinfoscript-061.tar.gz)

package() {
  cd $srcdir
  install -D -m644 bootinfoscript  $pkgdir/usr/bin/bootinfoscript
  chmod +x $pkgdir/usr/bin/bootinfoscript
}

md5sums=('dc1e9122be4c2be2b4f9a97b4a219be9')

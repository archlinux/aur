# Maintainer: M0Rf30

pkgname=iortcw-data
pkgver=1.51b
pkgrel=2
pkgdesc="Return to Castle Wolfenstein Single Player pk3s files (shared use)"
arch=('any')
url="ftp://ftp.internat.freebsd.org/pub/FreeBSD/distfiles/"
license=('GPL')
install='iortcw-data.install'
depends=('wolf-data')
source=("https://github.com/iortcw/iortcw/releases/download/$pkgver/patch-data-141.zip")

package() {

    cd $srcdir/main
  # Clean unneeded files    
    rm *.so *.dll
  
  # Move Data to Package Directory
    mkdir -p $pkgdir/opt/iortcw-data
    cp -r * $pkgdir/opt/iortcw-data/
}

md5sums=('291a37caa9d65d0b81f767918b76fa56')

# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=apw
pkgver=1.5
pkgrel=2
pkgdesc="A Package Wrapper - package wrapper for pacman (and more)"
arch=('any')
url="http://proyecto.jkanetwork.com"
license=('GPL3')
provides=('apw')
groups=('jka-toolkit')
options=(!emptydirs)
source=(https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/apw)
md5sums=('SKIP')
PKGEXT=".pkg.tar.xz"
package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/etc/
  echo "pacman" > "$pkgdir/etc/apw.conf"
  install -Dm755 $srcdir/apw "$pkgdir/usr/bin/" 
}

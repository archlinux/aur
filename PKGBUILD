# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=jkazip
pkgver=0.2.2
pkgrel=1
pkgdesc="A Package Wrapper - package wrapper for pacman (and more)"
arch=('any')
url="http://proyecto.jkanetwork.com"
license=('GPL3')
provides=('jkazip')
groups=('jka-toolkit')
options=(!emptydirs)
source=(https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/jkazip)
md5sums=('SKIP')
PKGEXT=".pkg.tar.xz"
package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm755 $srcdir/jkazip "$pkgdir/usr/bin/" 
}

# Maintainer: André <andre-arch@delorus.de>
pkgname=keepassx-mono-icons-light
pkgver=0.1
pkgrel=3
pkgdesc="KeePassX monochrome tray icons for light panels in Faenza style"
arch=('any')
license=('GPL')
depends=('keepassx')
#conflicts=('keepassx-mono-icons-dark')
source=(${pkgname}.tar.xz)
md5sums=('a25eb1dba53ddbddb07195c07f786e5a')

package() {
  mkdir -p ${pkgdir}/usr/share/keepassx/icons
  install -D -m 755 ${srcdir}/keepassx{,_locked}.png ${pkgdir}/usr/share/keepassx/icons/
#  install -D -m 755 ${srcdir}/keepassx_locked ${pkgdir}/usr/share/keepassx/icons
}

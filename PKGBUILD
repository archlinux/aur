# Maintainer: André <andre-arch@delorus.de>
pkgname=keepassx-mono-icons-light
pkgver=0.1
pkgrel=2
pkgdesc="KeePassX monochrome tray icons for light panels in Faenza style"
arch=('any')
url="https://github.com/FredericChopin/aur/tree/master/keepassx-mono-icons-light"
license=('GPL')
depends=('keepassx')
#conflicts=('keepassx-mono-icons-dark')
source=(${pkgname}.tar.xz)
md5sums=('672611b62416de99fd80856151a5f1fd')

build() {
  mkdir -p ${pkgdir}/usr/share/keepassx/icons
  install -D -m 755 ${srcdir}/keepassx{,_locked}.png ${pkgdir}/usr/share/keepassx/icons/
#  install -D -m 755 ${srcdir}/keepassx_locked ${pkgdir}/usr/share/keepassx/icons
}


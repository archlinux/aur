# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: uint2048_t

pkgname=pengupop
pkgver=2.2.2
_pkgver=37.fc40
pkgrel=37
pkgdesc="Clone of the retro arcade game Bust-a-move"
arch=('x86_64')
url='https://fedoraproject.org/wiki/Games/pengupop'
license=('GPL')
depends=('sdl')
source=("https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/p/pengupop-${pkgver}-${_pkgver}.x86_64.rpm")
sha256sums=('808a647c27b6c02a027a4768e888776a85bf32cd526c6d2e3a373e9ee4d13620')

package() {
  install -Dm755 usr/bin/pengupop "${pkgdir}"/usr/bin/pengupop
  install -Dm755 usr/share/applications/pengupop.desktop "${pkgdir}"/usr/share/applications/pengupop.desktop
  install -Dm755 usr/share/icons/hicolor/48x48/apps/pengupop.png "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/pengupop.png
}


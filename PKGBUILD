# Maintainer: robertfoster

pkgname=grub-theme-midna
_pkgname=midna
pkgver=3.1
pkgrel=1
pkgdesc="Midna Grub-theme."
url="http://kaosx.us"
arch=('x86_64')
license=('GPL' 'CC-SA')
depends=('grub-common')
install=grub-themes.install
source=("http://sourceforge.net/projects/kaosx/files/sources/grub-themes/${_pkgname}-${pkgver}.tar.xz")

package() {
  cd ${srcdir}

  install -dm755 ${pkgdir}/usr/share/grub/themes
  cp -dpr --no-preserve=ownership ${_pkgname} ${pkgdir}/usr/share/grub/themes
}
sha256sums=('30476cb46ac0fb5e896f665338537a9b04f957f92e146f0e37651f5cf96f23e2')

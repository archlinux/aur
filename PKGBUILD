
pkgname=grub-theme-midna
_pkgname=midna
pkgver=3.0
pkgrel=1
pkgdesc="Midna Grub-theme."
url="http://kaosx.us"
arch=('x86_64')
license=('GPL' 'CC-SA')
depends=('grub-common')
install=grub-themes.install
source=("http://sourceforge.net/projects/kaosx/files/sources/grub-themes/${_pkgname}-${pkgver}.tar.xz")
md5sums=('16f248ce02508a077d1357840e58902d')
 
package() {
  cd ${srcdir}
  
  install -dm755 ${pkgdir}/usr/share/grub/themes
  cp -dpr --no-preserve=ownership ${_pkgname} ${pkgdir}/usr/share/grub/themes
}

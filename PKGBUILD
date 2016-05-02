# Maintainer: M0Rf30

pkgname=grub-theme-midna
_pkgname=midna
pkgver=2.0
pkgrel=1
pkgdesc="Midna Grub-theme."
url="http://kaosx.us"
arch=('x86_64')
license=('GPL' 'CC-SA')
depends=('grub-common')
install=grub-themes.install
source=("http://sourceforge.net/projects/kaosx/files/sources/grub-themes/${_pkgname}-${pkgver}.xz")

package() {
  cd "${srcdir}"
  
  install -dm755 "$pkgdir/usr/share/grub/themes"
  cp -dpr --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/share/grub/themes"
}
md5sums=('8cffcfa4a57ea7dc1b976f67664de21f')

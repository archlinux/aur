# Maintainer: veyen <veyen33@gmail.com>

pkgname="adwaita-compact-gtk-theme"
pkgver=3.20.9.1
pkgrel=1
pkgdesc="Compact modification of Adwaita gtk2 and gtk3 theme"
arch=('any')
url="https://github.com/abihf/adwaita-compact"
license=('GPL')
depends=('gnome-themes-standard')
source=("https://github.com/abihf/adwaita-compact/archive/v${pkgver}.tar.gz")
#source=("adwaita-compact-${pkgver}.tar.gz")
md5sums=('129c35969a2d0e0cd5fa4efdb1c93f6d')

package() {
  cd "${srcdir}/adwaita-compact-${pkgver}"
  
  install -d ${pkgdir}/usr/share/themes/${pkgname}
  cp -rf * ${pkgdir}/usr/share/themes/${pkgname}
  
}

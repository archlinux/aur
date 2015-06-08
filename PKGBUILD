# Maintainer: FadeMind <fademind@gmail.com>

_name=Ambrosia
pkgname=gnome-shell-theme-ambrosia
pkgver=3.14_2.3
pkgrel=1
pkgdesc="Dark blue GNOME Shell theme for GNOME 3.14."
arch=('any')
url="http://opendesktop.org/content/show.php?content=166772"
license=('GPL3')
depends=('gnome-shell')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("${pkgname}-${pkgver}.tar.gz::http://opendesktop.org/CONTENT/content-files/166772-${_name}.tar.gz")
sha256sums=('88b2e2b716a4e7d46e385081e4465a45ac909da4f25d6f1adabe3cf22793fcf0')

package() {
  install -dm755 "${pkgdir}/usr/share/themes"
  cp -rf "${srcdir}/${_name}" "${pkgdir}/usr/share/themes"
  find ${pkgdir}/usr -type f -exec chmod 644 {} \;
  find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

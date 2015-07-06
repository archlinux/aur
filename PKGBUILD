# Maintainer: /dev/rs0 <rs0@secretco.de.com>
# Contributor: Robin Martinjak <rob@rmartinjak.de>

pkgname=archlinux-themes-balou
pkgver=1.0
pkgrel=2
pkgdesc="Theme for the Balou splash screen (xfce4)"

arch=('any')
url="http://www.xfce.org"
license=('GPL')

source=("http://rmartinjak.de/arch/${pkgname}-${pkgver}.tar.gz")
sha256sums=('056b51fabcd8b713382c80739ceca27dceef90a37828549dc8b24ba26ca1ea52')

package() {
  install -d "${pkgdir}/usr/share/themes"
  cp -a "${srcdir}/themes/." "${pkgdir}/usr/share/themes"
}

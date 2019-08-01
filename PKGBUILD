# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>
# Contributor: /dev/rs0 <rs0@secretco.de.com>
# Contributor: Robin Martinjak <rob@rmartinjak.de>

pkgname=archlinux-themes-balou
pkgver=1.0
pkgrel=3
pkgdesc="Theme for the Balou splash screen (xfce4)"
arch=('any')
url="http://www.xfce.org"
license=('GPL')
source=("http://pkg.lucasbrum.net/${pkgname}-${pkgver}.tar.gz")
md5sums=('26b9430d5619bced1ca49e6f1211113e')

package() {
  install -d "${pkgdir}/usr/share/themes"
  cp -a "${srcdir}/themes/." "${pkgdir}/usr/share/themes"
}

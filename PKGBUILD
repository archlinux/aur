# Maintainer: Runnytu < runnytu at gmail.com >
# OldMaintainer: Marko Cicak <cicakmarko at yahoo dot com>

pkgname=lxmed
pkgver=20120515
pkgrel=1
pkgdesc="Menu editor for LXDE"
url="http://sourceforge.net/projects/lxmed/"
license=('custom')
depends=('gksu' 'java-runtime' 'ttf-dejavu')
source=(${pkgname}-${pkgver}.tar.gz::http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}.tar.gz/download)
arch=('any')
md5sums=('dfbda46aad608d32f28ffdf44a3b1ac3')
		 
package() {
  cd "${srcdir}"/${pkgname}/content
  install -D -m644 LXMenuEditor.jar "${pkgdir}"/opt/${pkgname}/LXMenuEditor.jar
  install -D -m755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
  install -D -m644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
  install -D -m644 ${pkgname}.png "${pkgdir}"/opt/${pkgname}/${pkgname}.png
  install -D -m644 "${srcdir}"/${pkgname}/LICENCE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENCE.txt
}


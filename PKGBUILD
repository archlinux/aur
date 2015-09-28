# Contributor: Bernardo Barros <<bbarros at xsounds dot org>>
# Contributor: Thomas Weißschuh <thomas_weissschuh || lavabit || com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lilypond-devel-docs
pkgver=2.19.28
pkgrel=1
pkgdesc="Offline documentation for lilypond"
arch=(any)
url="http://lilypond.org"
license=('GPL')
options=('!strip')
source=("http://lilypond.org/download/binaries/documentation/lilypond-${pkgver}-1.documentation.tar.bz2")
md5sums=('8f6694d7a68357afd5e8c42ca1468c01')

package(){
  install -d ${pkgdir}/usr/share
  cp -R ${srcdir}/share/doc/ ${srcdir}/share/omf/ ${pkgdir}/usr/share/
}

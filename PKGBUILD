# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Matteo Mattei <matteo.mattei@gmail.com>

pkgname=libasecnsp11
pkgver=1
pkgrel=3
pkgdesc="Software for Carta Nazionale dei Servizi"
arch=('i686' 'x86_64')
url="http://www.regione.toscana.it/-/guida-all-uso-della-carta-numero-3"
license=('GPL')
depends=('pcsclite')
source=("http://www.regione.toscana.it/documents/10180/595930/smart_card.zip")
md5sums=('9075a7c4ae2645906e1068d0824c32ef')

package() {
  cd "${srcdir}"

  install -d ${pkgdir}/usr/lib
  if [ "`uname -m`" = "i686" ]
    then
      cp -a x86/libaseCnsP11.so ${pkgdir}/usr/lib/libaseCnsP11.so
    else
      cp -a x64/libaseCnsP11.so ${pkgdir}/usr/lib/libaseCnsP11.so
  fi
}

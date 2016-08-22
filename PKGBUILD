

# Maintainer: Spr <spr995.spr@gmail.com>
pkgname=libreoffice-extension-pepitocleaner
_pkgname=pepitocleaner
pkgver=0.1.16
pkgrel=1
pkgdesc="An extension created to quickly resolve the most common formatting mistakes"
arch=('any')
url="http://pepitoweb.altervista.org"
license=('LGPL')
groups=('libreoffice-extensions')
depends=('libreoffice')
source=("http://pepitoweb.altervista.org/PepitoCleaner.oxt")
noextract=("PepitoCleaner.oxt")
md5sums=('8f1cc1bdafc707dac7e678da772699cf')

package() {
  _DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_pkgname}/"
  install -dm755 "${_DESTDIR}"
  bsdtar -xf PepitoCleaner.oxt -C "${_DESTDIR}"
  chmod -R a=r,a+X,u+w "${_DESTDIR}"
}

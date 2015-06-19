

# Maintainer: Spr <spr995.spr@gmail.com>
pkgname=libreoffice-extension-pepitocleaner
_pkgname=pepitocleaner
pkgver=0.1.13
pkgrel=1
pkgdesc="An extension created to quickly resolve the most common formatting mistakes"
arch=('any')
url="http://pepitoweb.altervista.org"
license=('LGPL')
groups=('libreoffice-extensions')
depends=('libreoffice-common')
source=("http://pepitoweb.altervista.org/PepitoCleaner.oxt")
noextract=("PepitoCleaner.oxt")
md5sums=('2222a113c52ab3e5dc9a284b86c80eea')

package() {
  _DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_pkgname}/"
  install -dm755 "${_DESTDIR}"
  bsdtar -xf PepitoCleaner.oxt -C "${_DESTDIR}"
  chmod -R a=r,a+X,u+w "${_DESTDIR}"
}
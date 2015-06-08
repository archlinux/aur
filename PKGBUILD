# Maintainer: Polichronucci <nick at discloud dot eu>
# Contributor: helix <stargr[at]gmail[dot]com>
pkgname=libreoffice-extension-greek-dictionary
pkgver=1.1.0
pkgrel=2
pkgdesc='Greek dictionary from the OpenOffice.org project that works on LibreOffice'
arch=('any')
url='http://extensions.services.openoffice.org/en/project/el_dict'
license=('LGPL')
depends=('libreoffice')
groups=('libreoffice-extensions')
conflicts=('languagetool')
makedepends=('unzip')
source=('http://liquidtelecom.dl.sourceforge.net/project/aoo-extensions/1411/2/el_gr_v110.oxt')
md5sums=('bf9c22ea03e81ef21aa41c4869b3f38d')

package() {
  install -dm755 ${pkgdir}/usr/lib/libreoffice/share/extensions
  unzip -q ${srcdir}/el_gr_v110.oxt -d ${pkgdir}/usr/lib/libreoffice/share/extensions/greek-dictionary
}

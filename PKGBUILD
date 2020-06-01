# Maintainer: Frank Zimmermann <veltheimer_frank at t-online.de>

pkgname=libreoffice-template-briefvorlage-din-lang
_pkgname=briefvorlage-din-lang-dl-1-4
pkgver=1.2
pkgrel=1
pkgdesc="Libreoffice template DIN Brief lang"
arch=('any')
url="https://extensions.libreoffice.org/templates/briefvorlage-din-lang-dl"
license=('CC-by-sa-v3')
groups=('libreoffice-extensions')
depends=('libreoffice')
noextract=(${source[@]##*/})
source=(https://extensions.libreoffice.org/templates/briefvorlage-din-lang-dl/1.2/@@download/file/briefvorlage-din-lang-dl-1-4.ott)

md5sums=('49db02cfcf0df1bf249d9338642ad7cd')

package() {
   _DESTDIR="${pkgdir}/usr/lib/libreoffice/share/template/common/officorr/"
   install -dm755 "${_DESTDIR}"
   cp "$srcdir"/${_pkgname}.ott -d "${_DESTDIR}"
   chmod -R g-w,o-w "${_DESTDIR}"
}

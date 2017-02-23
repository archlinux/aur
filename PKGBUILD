# Maintainer: franzrogar <franzrogar gmail com>
# Contributor: delta48 <dark.magician.48+aur[at]gmail[dot]com>

pkgname=libreoffice-extension-dictionaries-es
pkgver=2.2
pkgrel=1
pkgdesc='Spanish dictionaries extension for LibreOffice'
arch=('any')
url='https://extensions.libreoffice.org/extensions/spanish-dictionaries'
license=('GPL3')
depends=('hunspell-es')
groups=('libreoffice-extensions')
conflicts=('languagetool')
source=(https://extensions.libreoffice.org/extensions/spanish-dictionaries/${pkgver}/@@download/file/es_any.oxt)
noextract=('es_any.oxt')
md5sums=('5d2a621da5e00871f5d43537b343a7c5')

package() {
  install -dm755 $pkgdir/usr/lib/libreoffice/share/extensions/spanish-dictionaries
  bsdtar -xf $srcdir/es_any.oxt -C $pkgdir/usr/lib/libreoffice/share/extensions/spanish-dictionaries
}

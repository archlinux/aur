# Maintainer: franzrogar <franzrogar gmail com>
# Contributor: delta48 <dark.magician.48[at]gmail[dot]com>
pkgname=libreoffice-extension-dictionaries-es
pkgver=0.7
pkgrel=2
pkgdesc='Spanish dictionaries extension for LibreOffice'
arch=('any')
url='http://extensions.libreoffice.org/extension-center/spanish-dictionaries/pscreleasefolder.2012-04-18.1033472248/0.7'
license=('GPL3')
depends=('hunspell-es')
groups=('libreoffice-extensions')
conflicts=('languagetool')
makedepends=('unzip')
source=(http://forja.rediris.es/frs/download.php/2933/es_ANY.oxt)
md5sums=('e3d4b38f280e7376178529db2ece982b')

package() {
  install -dm755 $pkgdir/usr/lib/libreoffice/share/extensions
  unzip -q $srcdir/es_ANY.oxt -d $pkgdir/usr/lib/libreoffice/share/extensions/spanish-dictionaries
}

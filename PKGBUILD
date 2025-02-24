# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=AyaSpell
pkgname=libreoffice-extension-${_name,,}
pkgver=3.5
pkgrel=1
pkgdesc="Arabic spelling and thesaurus dictionaries."
arch=('any')
url="https://ayaspell.sourceforge.net/"
license=('GPL-2.0' 'LGPL-2.1' 'MPL-1.1')
depends=('libreoffice')
_ref='4960/1687770780'
_name_source="dict-ar"
source=("https://extensions.libreoffice.org/assets/downloads/${_ref}/${_name_source}-${pkgver}.oxt")
sha256sums=('1f273bbf44ff627bdc7e4fe9239649cdf48e672b94c34ce5b791bbf069d2f05e')

package () {
  install -d "$pkgdir/usr/lib/libreoffice/share/extensions/"
  cp -R "$srcdir" "$pkgdir/usr/lib/libreoffice/share/extensions/$_name"
  rm -f "$pkgdir/lib/libreoffice/share/extensions/cooder/${_name}-${pkgver}.oxt"
}

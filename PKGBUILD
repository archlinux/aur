# Maintainer: franzrogar <franzrogar gmail com>
# Contributor: delta48 <dark.magician.48+aur[at]gmail[dot]com>

pkgname=libreoffice-extension-dictionaries-es
pkgver=0.8
pkgrel=2
pkgdesc='Spanish dictionaries extension for LibreOffice'
arch=('any')
url='http://extensions.libreoffice.org/extension-center/spanish-dictionaries'
license=('GPL3')
depends=('hunspell-es')
groups=('libreoffice-extensions')
conflicts=('languagetool')
source=(http://extensions.libreoffice.org/extension-center/spanish-dictionaries/pscreleasefolder.2012-04-18.1033472248/${pkgver}/es_any.oxt)
noextract=('es_any.oxt')
md5sums=('719839f3381ac3da5eb601c950658710')

package() {
  install -dm755 $pkgdir/usr/lib/libreoffice/share/extensions/spanish-dictionaries
  bsdtar -xf $srcdir/es_any.oxt -C $pkgdir/usr/lib/libreoffice/share/extensions/spanish-dictionaries
}

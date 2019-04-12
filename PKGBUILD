# Maintainer: franzrogar <franzrogar gmail com>
# Contributor: delta48 <dark.magician.48+aur[at]gmail[dot]com>

pkgname=libreoffice-extension-dictionaries-es
pkgver=2.4
pkgrel=1
pkgdesc='Spanish dictionaries extension for LibreOffice'
arch=('any')
url='https://extensions.libreoffice.org/extensions/spanish-dictionaries'
license=('GPL3')
groups=('libreoffice-extensions')
conflicts=('languagetool')
source=(https://extensions.libreoffice.org/extensions/spanish-dictionaries/${pkgver}/@@download/file/es_ANY.oxt)
noextract=('es_ANY.oxt')
sha256sums=('36507ebabce67d64056c51ee071b4bce2f2c2ebb150278561761480937a27f9a')


package() {
  install -dm755 $pkgdir/usr/lib/libreoffice/share/extensions/spanish-dictionaries
  bsdtar -xf $srcdir/es_ANY.oxt -C $pkgdir/usr/lib/libreoffice/share/extensions/spanish-dictionaries
  mv $pkgdir/usr/lib/libreoffice/share/extensions/spanish-dictionaries/Iberoamérica.png $pkgdir/usr/lib/libreoffice/share/extensions/spanish-dictionaries/Iberoamerica.png
}

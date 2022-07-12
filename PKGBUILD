# Maintainer: franzrogar <franzrogar gmail com>
# Contributor: delta48 <dark.magician.48+aur[at]gmail[dot]com>

pkgname=libreoffice-extension-dictionaries-es
pkgver=2.5
pkgrel=1
pkgdesc='Spanish dictionaries extension for LibreOffice'
arch=('any')
url='https://extensions.libreoffice.org/extensions/spanish-dictionaries'
license=('GPL3')
groups=('libreoffice-extensions')
conflicts=('languagetool')
source=(https://extensions.libreoffice.org/assets/downloads/z/e217baa9_es-any.oxt)
noextract=('e217baa9_es-any.oxt')
sha256sums=('55a7be2423dc106557fa762c8f921c89071ff7cc8a54019af8cafc3c833e3571')


package() {
  install -dm755 $pkgdir/usr/lib/libreoffice/share/extensions/spanish-dictionaries
  bsdtar -xf $srcdir/e217baa9_es-any.oxt -C $pkgdir/usr/lib/libreoffice/share/extensions/spanish-dictionaries
  mv $pkgdir/usr/lib/libreoffice/share/extensions/spanish-dictionaries/Iberoamérica.png $pkgdir/usr/lib/libreoffice/share/extensions/spanish-dictionaries/Iberoamerica.png
}

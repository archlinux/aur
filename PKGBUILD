# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=CiteQuran
pkgname=libreoffice-extension-${_name,,}
pkgver=3.0
pkgrel=1
pkgdesc="CiteQuran is a LibreOffice extension that allows you to Cite the Holy Quran in your Writer document without errors and with proper Arabic fonts."
arch=('any')
url="https://github.com/cdjalel/CiteQuran"
license=('GPL-3.0')
depends=('libreoffice')
source=("${url}/releases/download/v${pkgver}/${_name}-v${pkgver}.oxt")
sha256sums=('2dcf2ca555277bc7a6cb77778dd24233dee37de8edb534f1fa31f00ca2875291')

package () {
  install -d "$pkgdir/usr/lib/libreoffice/share/extensions/"
  cp -R "$srcdir" "$pkgdir/usr/lib/libreoffice/share/extensions/$_name"
  rm -f "$pkgdir/lib/libreoffice/share/extensions/cooder/${_name}-${pkgver}.oxt"
}

# Maintaner: bzt <unmacaque at gmail dot com>

pkgname=libreoffice-extension-coooder
_name=coooder
pkgver=1.1.2
pkgrel=8
pkgdesc="Coooder is a syntax highlighting extension for Writer."
arch=('any')
url="https://extensions.libreoffice.org/extensions/$_name"
license=('LGPL')
depends=('libreoffice')
source=("https://extensions.libreoffice.org/assets/downloads/z/${_name}-${pkgver//./-}.oxt")
md5sums=('7b0ad997271539b80303eeb63dbf78a2')

package () {
  install -d "$pkgdir/usr/lib/libreoffice/share/extensions/"
  cp -R "$srcdir" "$pkgdir/usr/lib/libreoffice/share/extensions/$_name"
  rm -f "$pkgdir/lib/libreoffice/share/extensions/cooder/${_name}-${pkgver//./-}.oxt"
}

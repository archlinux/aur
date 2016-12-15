# Maintaner: bzt <unmacaque at gmail dot com>

pkgname=libreoffice-extension-coooder
pkgver=1.1.2
pkgrel=2
pkgdesc="Coooder is a syntax highlighting extension for Writer."
arch=('any')
url="https://extensions.libreoffice.org/extensions/coooder"
license=('LGPL2')
depends=('libreoffice')
source=("https://extensions.libreoffice.org/extensions/coooder/$pkgver/@@download/file/coooder-$pkgver.oxt")
md5sums=('7b0ad997271539b80303eeb63dbf78a2')

package () {
  install -d "$pkgdir/usr/lib/libreoffice/share/extensions/"
  cp -R "$srcdir" "$pkgdir/usr/lib/libreoffice/share/extensions/cooder"
  rm -f "$pkgdir/usr/lib/libreoffice/share/extensions/cooder/coooder-$pkgver.oxt"
}

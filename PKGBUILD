# Maintaner: bzt <unmacaque at gmail dot com>

pkgname=libreoffice-extension-coooder
pkgver=1.1.2
pkgrel=2
pkgdesc="Coooder is a syntax highlighting extension for Writer."
arch=('any')
url="http://extensions.libreoffice.org/extension-center/coooder"
license=('LGPL2')
depends=('libreoffice')
source=("http://extensions.libreoffice.org/extension-center/coooder/releases/$pkgver/coooder-$pkgver.oxt")
md5sums=('7b0ad997271539b80303eeb63dbf78a2')

package () {
  install -d "$pkgdir/usr/lib/libreoffice/share/extensions/"
  cp -R "$srcdir" "$pkgdir/usr/lib/libreoffice/share/extensions/cooder"
  rm -f "$pkgdir/usr/lib/libreoffice/share/extensions/cooder/coooder-$pkgver.oxt"
}


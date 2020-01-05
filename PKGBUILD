# Maintainer: caiye <ye[dot]jingchen [at] gmail[dot]com>
# Maintainer: goetzc
# Maintainer: cjfloss
# Contributors: Ner0

pkgname=gtk-theme-elementary
_realname=stylesheet
pkgver=5.4.0
pkgrel=1
pkgdesc="The official elementary GTK theme designed to be smooth, attractive, fast, and usable."
arch=('any')
url="https://github.com/elementary/stylesheet"
license=('GPL3')
groups=('pantheon')
optdepends=('elementary-icon-theme: the elementary icon theme')
conflicts=('elementary-gtk-theme' 'egtk-bzr')
source=("$pkgname-$pkgver.tar.gz::https://github.com/elementary/$_realname/archive/$pkgver.tar.gz")
sha256sums=('52e1f30e7ff11920d7a7471902c5cb82958c51f530d270530aaba769ad34b46e')

package() {
    install -d "$pkgdir/usr/share/themes"
    mv "$srcdir/$_realname-$pkgver/elementary" "$pkgdir/usr/share/themes/"
}


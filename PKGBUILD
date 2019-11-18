# Maintainer: caiye <ye[dot]jingchen [at] gmail[dot]com>
# Maintainer: goetzc
# Contributors: Ner0

pkgname=gtk-theme-elementary
_realname=stylesheet
pkgver=5.3.0
pkgrel=1
pkgdesc="The official elementary GTK theme designed to be smooth, attractive, fast, and usable."
arch=('any')
url="https://github.com/elementary/stylesheet"
license=('GPL3')
groups=('pantheon')
optdepends=('elementary-icon-theme: the elementary icon theme')
conflicts=('elementary-gtk-theme' 'egtk-bzr')
source=("$pkgname-$pkgver.tar.gz::https://github.com/elementary/$_realname/archive/$pkgver.tar.gz")

package() {
    install -d "$pkgdir/usr/share/themes"
    mv "$srcdir/$_realname-$pkgver/elementary" "$pkgdir/usr/share/themes/"
}
sha256sums=('03da933a4df4f67364a24c6ddfeb54bcbdca9c9d67a493ccb388a44585b14592')

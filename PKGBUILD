# Maintainer: caiye <ye[dot]jingchen [at] gmail[dot]com>
# Maintainer: goetzc
# Contributors: Ner0

pkgname=gtk-theme-elementary
_realname=stylesheet
pkgver=5.2.3
pkgrel=1
pkgdesc="The official elementary GTK theme designed to be smooth, attractive, fast, and usable."
arch=('any')
url="https://github.com/elementary/stylesheet"
license=('GPL3')
groups=('pantheon')
optdepends=('elementary-icon-theme: the elementary icon theme')
conflicts=('elementary-gtk-theme' 'egtk-bzr')
source=("$pkgname-$pkgver.tar.gz::https://github.com/elementary/$_realname/archive/$pkgver.tar.gz")
sha256sums=('ddc4250110b427dc5485ebb316361ef7595b5b78f7b0f9792ab61b33fa3cc3dd')

package() {
    install -d "$pkgdir/usr/share/themes"
    mv "$srcdir/$_realname-$pkgver/elementary" "$pkgdir/usr/share/themes/"
}

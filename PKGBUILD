# Maintainer: caiye <ye[dot]jingchen [at] gmail[dot]com>
# Maintainer: goetzc
# Contributors: Ner0

pkgname=gtk-theme-elementary
_realname=stylesheet
pkgver=5.2.5
pkgrel=1
pkgdesc="The official elementary GTK theme designed to be smooth, attractive, fast, and usable."
arch=('any')
url="https://github.com/elementary/stylesheet"
license=('GPL3')
groups=('pantheon')
optdepends=('elementary-icon-theme: the elementary icon theme')
conflicts=('elementary-gtk-theme' 'egtk-bzr')
source=("$pkgname-$pkgver.tar.gz::https://github.com/elementary/$_realname/archive/$pkgver.tar.gz")
sha256sums=('85fc9293c55e9bf3699b79435b6bc555ec0b4827900eb53e9ca6910afd55fcfb')

package() {
    install -d "$pkgdir/usr/share/themes"
    mv "$srcdir/$_realname-$pkgver/elementary" "$pkgdir/usr/share/themes/"
}

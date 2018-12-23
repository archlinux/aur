# Maintainer: caiye <ye[dot]jingchen [at] gmail[dot]com>
# Maintainer: goetzc
# Contributors: Ner0

pkgname=gtk-theme-elementary
_realname=stylesheet
pkgver=5.2.1
pkgrel=1
pkgdesc="The official elementary GTK theme designed to be smooth, attractive, fast, and usable."
arch=('any')
url="https://launchpad.net/egtk"
license=('GPL3')
groups=('pantheon')
optdepends=('elementary-icon-theme: the elementary icon theme')
conflicts=('elementary-gtk-theme' 'egtk-bzr')
source=("$pkgname-$pkgver.tar.gz::https://github.com/elementary/$_realname/archive/$pkgver.tar.gz")
sha256sums=('b6104a5380a77ea1634706afb749b6ea482e98af970d134fe00a7b0fcb841934')

package() {
    install -d "$pkgdir/usr/share/themes"
    mv $srcdir/"$_realname-$pkgver/elementary" $pkgdir/usr/share/themes/
}

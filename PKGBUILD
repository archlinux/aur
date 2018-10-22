# Maintainer: caiye <ye[dot]jingchen [at] gmail[dot]com>
# Maintainer: goetzc
# Contributors: Ner0

pkgname=gtk-theme-elementary
_realname=stylesheet
pkgver=5.2.0
pkgrel=1
pkgdesc="The official elementary GTK theme designed to be smooth, attractive, fast, and usable."
arch=('any')
url="https://launchpad.net/egtk"
license=('GPL3')
groups=('pantheon')
optdepends=('elementary-icon-theme: the elementary icon theme')
conflicts=('elementary-gtk-theme' 'egtk-bzr')
source=("$pkgname-$pkgver.tar.gz::https://github.com/elementary/$_realname/archive/$pkgver.tar.gz")
sha256sums=(4a72ba818f57ba7063e092ccdf0ca8ff23185514d5eda1a5a28fe594e0049835)

package() {
    install -d "$pkgdir/usr/share/themes"
    mv $srcdir/"$_realname-$pkgver/elementary" $pkgdir/usr/share/themes/
}

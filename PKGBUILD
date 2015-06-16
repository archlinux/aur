# Maintainer: Ced <cedl38@gmail.com>

pkgname=alinea-themes
pkgver=2.2.1
pkgrel=1
pkgdesc="Simple xfwm4 and metacity-1 theme. Theses themes use GTK themes colors to be adaptable on them."
arch=('any')
url="http://xfce-look.org/content/show.php?content=154240"
license=('GPL3')
depends=('xfwm4>=4.8')
optdepends=('xfce4-notifyd>=0.2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cedl38/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e55229b65e2bd816eae5c2a872d1483f7f12994cb59432608378a0e0faf666da')

build() {
  cd $srcdir/$pkgname'-'$pkgver
  install -d -m755 $pkgdir/usr/share/themes
  cp -r ${pkgname%%-*}* $pkgdir/usr/share/themes || return 1
}

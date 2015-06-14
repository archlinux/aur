# Maintainer: Ced <cedl38@gmail.com>

pkgname=mini-xfwm4-theme
pkgver=1.2
pkgrel=1
pkgdesc="Very thin theme for Xfce to keep space for windows."
arch=('any')
url="http://xfce-look.org/content/show.php?content=154240"
license=('GPL3')
depends=('xfwm4>=4.8')
optdepends=('xfce4-notifyd>=0.2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cedl38/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a3b768c857d1ce2324843263f79fd0b7e81767b4506d80d0b68e57811a81ef4d')

build() {
  cd $srcdir/$pkgname'-'$pkgver
  install -d -m755 $pkgdir/usr/share/themes
  cp -r ${pkgname%%-*}* $pkgdir/usr/share/themes || return 1
}

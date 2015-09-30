# $Id: PKGBUILD 102146 2013-12-05 21:14:10Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: TDY <tdy@gmx.com>

pkgname=helpdeco
pkgver=2.1.3
pkgrel=1
pkgdesc="Decompiler for WinHelp (.hlp) files"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
url="http://sourceforge.net/projects/helpdeco/"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('6ef5dd1a4a397589e5bcdd308820f4d38cbf53e413971231505a998bc1c8003de3b291483743027280ff3113338fc0ed9553066435ee5ffb597da33a487e2638')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install prefix="$pkgdir/usr"
}

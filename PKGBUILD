# Maintainer: Brandon Milton <brandon.milton21@gmail.com>
pkgname=wallepy
pkgver=0.02
pkgrel=1
pkgdesc="An automatic wallpaper getter and setter using feh"
arch=('any')
url="https://github.com/brandonio21/wallepy"
license=('MIT')
depends=('python>=3' 'python-click')
source=("https://github.com/brandonio21/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d88ec6622d5455611d671ea385c132c252583acabdb4f84469962def4d7a9b36')

package() {
  cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib/systemd/user

  install walle.py $pkgdir/usr/bin
  install wallepy.service $pkgdir/usr/lib/systemd/user
}

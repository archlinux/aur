# Maintainer: Brandon Milton <brandon.milton21@gmail.com>
pkgname=wallepy
pkgver=0.01
pkgrel=1
pkgdesc="An automatic wallpaper getter and setter using feh"
arch=('any')
url="https://github.com/brandonio21/wallepy"
license=('MIT')
depends=('python>=3' 'python-click')
source=("https://github.com/brandonio21/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3ab8212d5da35611e98a4ecab6a7cd3456cdea50e4eba3178cad36785043b5cb')

package() {
  cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib/systemd/user

  install walle.py $pkgdir/usr/bin
  install wallepy.service $pkgdir/usr/lib/systemd/user
}

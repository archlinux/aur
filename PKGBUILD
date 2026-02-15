# Maintainer: Pysio <qq593277393@outlook.com>

pkgname=oopz
pkgver=1.0.0
pkgrel=1
pkgdesc="OOPZ desktop client - free online voice platform"
arch=('x86_64')
url="https://git.pysio.online/pysio/linux_oopz"
license=('LicenseRef-proprietary')
depends=('electron39')
_commit=74c8cb2f6f3a996bef239fafdcafa2ca16346773
source=("$pkgname::git+https://git.pysio.online/pysio/linux_oopz.git#commit=$_commit")
sha256sums=('61674b3f93b5c2a974000593c48b9fe1fe1b7ac9929ad25d38c65d1b618b5714')

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 main.js        "$pkgdir/opt/$pkgname/main.js"
  install -Dm644 icon.png       "$pkgdir/opt/$pkgname/icon.png"
  install -Dm755 oopz.sh        "$pkgdir/usr/bin/$pkgname"
  install -Dm644 oopz.desktop   "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 icon.png       "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}

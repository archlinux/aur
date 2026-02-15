# Maintainer: Pysio <qq593277393@outlook.com>

pkgname=oopz
pkgver=1.0.0
pkgrel=1
pkgdesc="OOPZ desktop client - third-party Electron package for the free online voice platform"
arch=('x86_64')
url="https://git.pysio.online/pysio/linux_oopz"
license=('LicenseRef-proprietary')
depends=('electron39')
_commit=8da2a5a18d0db26db220e36234442c9d4f1a4249
source=("$pkgname::git+https://git.pysio.online/pysio/linux_oopz.git#commit=$_commit")
sha256sums=('ca8092bd281dca48cd5387fab2c887cbce11b3dd7d8dd82c56fc93c99882ee3b')

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 main.js        "$pkgdir/opt/$pkgname/main.js"
  install -Dm644 icon.png       "$pkgdir/opt/$pkgname/icon.png"
  install -Dm755 oopz.sh        "$pkgdir/usr/bin/$pkgname"
  install -Dm644 oopz.desktop   "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 icon.png       "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}

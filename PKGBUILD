# Maintainer: Pysio <qq593277393@outlook.com>

pkgname=oopz
pkgver=1.0.0
pkgrel=1
pkgdesc="OOPZ desktop client - third-party Electron package for the free online voice platform"
arch=('x86_64')
url="https://git.pysio.online/pysio/linux_oopz"
license=('LicenseRef-proprietary')
depends=('electron39')
_commit=415970ea116c94eddde56f269fa3ea86b0534d75
source=("$pkgname::git+https://git.pysio.online/pysio/linux_oopz.git#commit=$_commit")
sha256sums=('44c29660e4cdd48d8251e63bd07bd106b2589620a90a92f817cd662451e3f037')

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 main.js        "$pkgdir/opt/$pkgname/main.js"
  install -Dm644 icon.png       "$pkgdir/opt/$pkgname/icon.png"
  install -Dm755 packages/archlinux/oopz.sh        "$pkgdir/usr/bin/$pkgname"
  install -Dm644 packages/archlinux/oopz.desktop   "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 icon.png       "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}

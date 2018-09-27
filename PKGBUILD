# Maintainer: Khorev  Aleksey <khorevaa@gmail.com>

pkgname=ovm
pkgver=1.0.0
_pkgver=v1.0.0-RC6  #https://github.com/silverbulleters/ovm/releases/download/v1.0.0-RC6/ovm.exe
pkgrel=1
pkgdesc=" OneScript Version Manager"
arch=("i686" "x86_64")
license=('GPL3' 'LGPL3')
url="https://github.com/silverbulleters/ovm"
depends=('mono')
makedepens=('tar ar xz')

source=(
        "ovm.exe::https://github.com/silverbulleters/ovm/releases/download/$_pkgver/ovm.exe"
        )

md5sums=('038d01d2415ecb91a332182711ffa4ab')


package() {
  cd $srcdir
  mkdir -p "$pkgdir/usr/bin/"
  cp -r .  $pkgdir/usr/bin/
  install -Dm755 $startdir/ovm "$pkgdir/usr/bin/ovm"
  
}

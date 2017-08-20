# Maintainer: Michał Sidor (Michcioperz) <packages at meekchopp dot es>
pkgname=cmpdl-bin
pkgver=1.1.3
source=("https://github.com/Vazkii/CMPDL/releases/download/$pkgver/cmpdl-$pkgver.jar"
        "cmpdl.sh")
pkgrel=1
pkgdesc="Curse Modpack Downloader"
arch=('any')
url="https://www.h2o.ai/h2o/"
license=('WTFPL')
depends=('java-runtime>=7')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/java/cmpdl"
  cp "cmpdl-$pkgver.jar" "$pkgdir/usr/share/java/cmpdl/cmpdl.jar"
  install -Dm755 $srcdir/cmpdl.sh "$pkgdir/usr/bin/cmpdl"
}
md5sums=('95624a49412db32936eb6c20ba4517ea'
         '75b41a5ecc6451082cb27a0c5f90f606')

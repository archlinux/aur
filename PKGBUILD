# Maintainer: Alexis <alexis.paz@gmail.com>

pkgname=jchempaint
pkgver=3.4b
pkgrel=1
pkgdesc="A 2D chemical structure editor written in Java (beta version)"
arch=( x86_64 )
url="https://jchempaint.github.io/"
license=('LGPL')
depends=('java-runtime')
source=("https://github.com/JChemPaint/jchempaint/releases/download/3.4b/JChemPaint.jar"
        "jchempaint.sh")
sha256sums=('34ed419e7b3a1a3eda1e934cf15dbb8c11a7beb216b79132f695993e488d3563'
            'd58f8bb2e48b3e0ca3e70522c5bad316229d044c4f99a0fe411360de1fc90866')

package() {
  install -d "$pkgdir/opt/jchempaint"
  install -m644 "JChemPaint.jar" "$pkgdir/opt/jchempaint/jchempaint.jar"

  install -Dm755 "$srcdir/jchempaint.sh" "$pkgdir/usr/bin/jchempaint"

}


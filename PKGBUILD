# Maintainer: Michał Sidor (Michcioperz) <packages at meekchopp dot es>
pkgname=h2o-ai-bin
pkgver=3.10.4.8
source=("http://h2o-release.s3.amazonaws.com/h2o/rel-ueno/8/h2o-$pkgver.zip"
        "h2o-ai.sh")
pkgrel=1
pkgdesc="Open source machine learning API"
arch=('x86_64')
url="https://www.h2o.ai/h2o/"
license=('Apache')
depends=('java-runtime>=7' 'java-runtime<9')

package() {
  cd $srcdir/h2o-$pkgver
  mkdir -p "$pkgdir/usr/share/java/h2o-ai"
  cp h2o.jar "$pkgdir/usr/share/java/h2o-ai"
  install -Dm755 $srcdir/h2o-ai.sh "$pkgdir/usr/bin/h2o-ai"
}
md5sums=('ca9904a5c64aca34b04fce16acc87a27'
         '008aadd36da7ad0d0b8a31a21ac3975d')

# Maintainer: Jeffrey Crochet <jlcrochet at pm dot me>

pkgname=gohufont-otb
pkgver=2.1
pkgrel=7
pkgdesc="OpenType bitmap conversion of Gohufont"
arch=(any)
url=https://font.gohu.org
license=(custom:WTFPL)
conflicts=(gohufont gohu-ttf gohufont-powerline)
source=(https://font.gohu.org/gohufont-$pkgver-otb.tar.gz)
md5sums=('f2b1a23af358988a014e2386e55bdda3')

package() {
    cd "$srcdir/gohufont-$pkgver-otb"
    for i in *.otb; do
        install -Dm 644 $i "$pkgdir/usr/share/fonts/$pkgname/$i"
    done
    install -Dm 644 COPYING-LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING-LICENSE"
}

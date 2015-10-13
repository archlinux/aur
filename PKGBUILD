# Maintainer: Dolores Portalatin <meskarune at gmail dot com>
pkgname=stardict-jmdict-ja-en
pkgver=2.4.2
pkgrel=1
pkgdesc="Stardict Japanese-Multilingual Dictionary: Japanese to English."
url="http://www.edrdg.org/jmdict/j_jmdict.html"
arch=('any')
license=(cc-by-sa-3.0)
source=(http://abloz.com/huzheng/stardict-dic/ja/stardict-jmdict-ja-en-2.4.2.tar.bz2)
md5sums=('2c574aef86a5d7bab45395d7e8ee7f6b')

package() {
    cd $srcdir/$pkgname-$pkgver/
    mkdir -p $pkgdir/usr/share/stardict/dic/
    install -m 644 * $pkgdir/usr/share/stardict/dic/
}

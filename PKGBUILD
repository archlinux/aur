# Maintainer: Dolores Portalatin <meskarune at gmail dot com>
pkgname=stardict-jmdict-en-ja
pkgver=2.4.2
pkgrel=1
pkgdesc="Stardict Japanese-Multilingual Dictionary: English to Japanese."
url="http://www.edrdg.org/jmdict/j_jmdict.html"
arch=('any')
license=(cc-by-sa-3.0)
source=(http://abloz.com/huzheng/stardict-dic/ja/$pkgname-$pkgver.tar.bz2)
md5sums=('e0f60d6acc4e3df6784805816b2e136f')

package() {
    cd $srcdir/$pkgname-$pkgver/
    mkdir -p $pkgdir/usr/share/stardict/dic/
    install -m 644 * $pkgdir/usr/share/stardict/dic/
}

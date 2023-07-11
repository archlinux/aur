# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>
# Submitter: Dolores Portalatin <meskarune at gmail dot com>
pkgname=stardict-jmdict-ja-en
pkgver=2.4.2
pkgrel=2
pkgdesc="Stardict Japanese-Multilingual Dictionary: Japanese to English."
url="http://www.edrdg.org/jmdict/j_jmdict.html"
arch=('any')
license=(cc-by-sa-3.0)
source=(http://download.huzheng.org/ja/$pkgname-$pkgver.tar.bz2)
md5sums=('2c574aef86a5d7bab45395d7e8ee7f6b')

package() {
    cd $srcdir/$pkgname-$pkgver/
    mkdir -p $pkgdir/usr/share/stardict/dic/
    install -m 644 * $pkgdir/usr/share/stardict/dic/
}

# Maintainer: Dolores Portalatin <meskarune at gmail dot com>
pkgname=stardict-thesaurus-ee
pkgver=2.4.2
pkgrel=1
pkgdesc="Stardict English Thesaurus"
url="http://abloz.com/huzheng/stardict-dic/"
arch=('any')
license=(public-domain)
source=(http://abloz.com/huzheng/stardict-dic/dict.org/$pkgname-$pkgver.tar.bz2)
md5sums=('b916732a00d5e11750a82a4bc62c2052')

package() {
    cd $srcdir/$pkgname-$pkgver/
    mkdir -p $pkgdir/usr/share/stardict/dic/
    install -m 644 * $pkgdir/usr/share/stardict/dic/
}

# Contributor: Igor Belov <ivbelov@gmail.com>
# Maintainer: Dennis Borisevich/denspirit <elfmax@tut.by>

pkgname=stardict-full-rus-eng
pkgver=2.4.2
pkgrel=1
pkgdesc="Large russian-english dictionary for Stardict"
license=('GPL')
optdepends=(
'stardict: for viewing this dictionary'
)
url="http://abloz.com/huzheng/stardict-dic/ru/"
md5sums=('91465d9fa5c469c088eb2e63a423f7bb')
source=("http://abloz.com/huzheng/stardict-dic/ru/$pkgname-$pkgver.tar.bz2")
arch=(any)
package() {
    cd $srcdir/$pkgname-$pkgver/
    mkdir -p $pkgdir/usr/share/stardict/dic/
    install -m 644 * $pkgdir/usr/share/stardict/dic/
  }


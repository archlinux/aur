# Contributor: Igor Belov <ivbelov@gmail.com>
# Maintainer: Dennis Borisevich/denspirit <elfmax@tut.by>

pkgname=stardict-full-rus-eng
pkgver=2.4.2
pkgrel=3
pkgdesc="Large russian-english dictionary for Stardict"
license=('GPL')
optdepends=(
'stardict: for viewing this dictionary'
)
#url='http://getfr.no-ip.org/pub/dc/software/stardict-ru/'
url='http://download.huzheng.org/ru/'
source=("http://download.huzheng.org/ru/$pkgname-$pkgver.tar.bz2")
md5sums=('91465d9fa5c469c088eb2e63a423f7bb')
arch=(any)
package() {
    cd $srcdir/$pkgname-$pkgver/
    mkdir -p $pkgdir/usr/share/stardict/dic/
    install -m 644 * $pkgdir/usr/share/stardict/dic/
  }


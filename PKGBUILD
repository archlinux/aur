# Contributor: Igor Belov <ivbelov@gmail.com>
# Maintainer: Dennis Borisevich/denspirit <elfmax@tut.by>

pkgname=stardict-full-eng-rus
pkgver=2.4.2
pkgrel=1
pkgdesc="Large english-russian dictionary for Stardict"
license=('GPL')
optdepends=(
'stardict: for viewing this dictionary'
)
url=('http://getfr.no-ip.org/pub/dc/software/stardict-ru/')
source=("http://getfr.no-ip.org/pub/dc/software/stardict-ru/$pkgname-$pkgver.tar.bz2")
md5sums=('9d6eff29898a47f5c12c5bc9836a03eb')
arch=(any)
package() {
    cd $srcdir/$pkgname-$pkgver/
    mkdir -p $pkgdir/usr/share/stardict/dic/
    install -m 644 * $pkgdir/usr/share/stardict/dic/
  }


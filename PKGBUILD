# Contributor: Igor Belov <ivbelov@gmail.com>
# Maintainer: Dennis Borisevich/denspirit <elfmax@tut.by>

pkgname=stardict-en-ru-bars
pkgver=2.4.2
pkgrel=3
pkgdesc="Large english-russian dictionary for Stardict"
license=('unknown')
optdepends=(
'stardict: for viewing this dictionary'
)
url="http://stardict.sourceforge.net"
md5sums=('9ef8466511414320d1fa6413b7c12f2f')
source=("http://abloz.com/huzheng/stardict-dic/ru/$pkgname-$pkgver.tar.bz2")
arch=(any)
package() {
    cd $srcdir/$pkgname-$pkgver/
    mkdir -p $pkgdir/usr/share/stardict/dic/
    install -m 644 * $pkgdir/usr/share/stardict/dic/
  }


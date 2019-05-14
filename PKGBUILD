pkgname=eywa
pkgver=0.0.0
pkgrel=1
pkgdesc="A future programing language"
arch=('any')
licence=('GPL3')
groups=('base-devel')
url='https://git.fumseck.eu/cgit/eywa'
source=("https://git.fumseck.eu/cgit/$pkgname/snapshot/$pkgname-$pkgver.tar.gz")
md5sums=('1ffa0aea3e98d84fc933a5702fc28d2c')
depends=('ji')
package()
{
    cd "$srcdir/$pkgname-$pkgver"
    make
    sudo make install
}


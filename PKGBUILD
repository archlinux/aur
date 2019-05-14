pkgname=ji
pkgver=0.0.1
pkgrel=1
pkgdesc="The eywa compiler"
arch=('any')
licence=('GPL3')
groups=('base-devel')
url='https://git.fumseck.eu/cgit/ji'
source=("https://git.fumseck.eu/cgit/$pkgname/snapshot/$pkgname-$pkgver.tar.gz")
md5sums=('85f870d02815b9c51697b21f53952d80')

package()
{
    cd "$srcdir/$pkgname-$pkgver"
    make
    sudo make install
}


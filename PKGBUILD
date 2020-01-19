# Maintainer: Jannik Becher <becher.jannik@gmail.com>

pkgname=rshell
pkgver=0.0.24
pkgrel=1
pkgdesc="A remote shell for working with MicroPython boards."
url="https://github.com/dhylands/rshell"
depends=('python' )
makedepends=('python3' 'python-udev')
license=('MIT')
arch=('any')
source=('https://files.pythonhosted.org/packages/5e/70/d48ce2329734b214d81b08b7ba048869eefafac9d5b482dbccd4f7a4dbef/rshell-0.0.24.tar.gz')
md5sums=('6fc1bda8781d1ca77a0d1e37b58620ef')

build() {
    cd $srcdir/rshell-0.0.24
    python setup.py build
}

package() {
    cd $srcdir/rshell-0.0.24
    python setup.py install --root="$pkgdir" --optimize=1 
}

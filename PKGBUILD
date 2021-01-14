# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=interminal
pkgver=0.3.7
pkgrel=5
pkgdesc="Utility for launching commands in a GUI terminal"
url="https://github.com/chrisjbillington/interminal"
depends=('python' 'python-pexpect')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('2eee41cae9cc5e2885c29be6eac9e175a5f5b44be8d17153862db09c087f37e0')

build() {
    cd $srcdir/interminal-0.3.7
    python setup.py build
}

package() {
    cd $srcdir/interminal-0.3.7
    python setup.py install --root="$pkgdir" --optimize=1 
}

pkgname=pygments-base16
pkgver=1.0.3
pkgrel=1
pkgdesc="Base16 styles for Pygments"
url="https://github.com/mohd-akram/base16-pygments"
depends=('python' 'python-pygments' )
makedepends=('python' 'python-setuptools')
license=('MIT')
arch=('any')
source=(https://files.pythonhosted.org/packages/b4/84/a52861bcf6b1ccdd83fbd7443ccf430321eb9ca00ff8dd89473ba0ace63f/pygments-base16-${pkgver}.tar.gz)
sha256sums=('c85a74be2cead720bf16c08e724dbfe39a15f3583ea0413991169710d9e025f3')
build() {
    cd "$srcdir/pygments-base16-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pygments-base16-${pkgver}/"
    python setup.py install --root="$pkgdir/" --optimize=1 
}

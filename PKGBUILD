# Maintainer: OctopusET
pkgname=python-norminette
pkgver=2.52
pkgrel=1
pkgdesc="Open source norminette"
arch=('any')
url='https://github.com/42School/norminette'
license=('MIT')
depends=('python-argparse')
makedepends=('git' 'python-setuptools')
source=("$pkgname"::'git+https://github.com/42School/norminette.git')
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

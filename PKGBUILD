# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Dmitry Petukhov <info@simplexum.com>

pkgname=python-bitcointx-git
pkgver=0.0.1
pkgrel=1
pkgdesc='A python3 library providing an easy interface to the Bitcoin data structures'
arch=('any')
url='https://github.com/Simplexum/python-bitcointx'
license=('MIT')
depends=('libsecp256k1')
provides=('python-bitcointx-git' 'python-bitcointx')
conflicts=('python-bitcointx-git' 'python-bitcointx')
source=('git+https://github.com/Simplexum/python-bitcointx')
sha256sums=('SKIP')
package() {
    cd "$srcdir/python-bitcointx/"
    python setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr
}

pkgbase='python-authlib'
pkgname=('python-authlib')
pkgver=0.14.3
pkgrel=1
pkgdesc="The ultimate Python library in building OAuth and OpenID Connect servers."
url="https://authlib.org/"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/A/Authlib/Authlib-$pkgver.tar.gz")
sha256sums=('cc52908e9e996f3de2ac2f61bf1ee6c6f1c5ce8e67c89ff2ca473008fffc92f6')

build() {
    cd "Authlib-$pkgver"
    python setup.py build
}

package() {
    cd "Authlib-$pkgver"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

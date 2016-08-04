pkgbase=('python-dirlog')
pkgname=('python-dirlog')
_module='dirlog'
pkgver='0.2.7'
pkgrel=1
pkgdesc="keep a log of directories you visit to get back fast"
url="https://github.com/ninjaaron/dirlog"
depends=('python')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://pypi.python.org/packages/cd/b2/5d7414203b14311a61838b4372714d6b3b1724e86587be8f6f0b074f0402/dirlog-${pkgver}.tar.gz")
md5sums=('c4220c94134ba626a2722e8afe7730a1')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

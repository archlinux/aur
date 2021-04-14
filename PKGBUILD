# Maintainer : pianoslum <pianoslum@mailbox.org>

pkgname=gprof2dot
pkgver=2021.2.21
pkgrel=1
pkgdesc='A Python script to convert the output from many profilers into a dot graph.'
arch=('any')
url='https://github.com/jrfonseca/gprof2dot/'
license=('LGPL')
depends=('python' 'graphviz')
makedepends=('python-setuptools')
provides=(gprof2dot)
source=("https://files.pythonhosted.org/packages/0f/80/11d3ec1703cc61606ddc68851747d1d1df3700d5e6c2b559af6dbeb398c5/${pkgname}-${pkgver}.tar.gz")
md5sums=('bafd2e4b3d6f1cd62795c90cff5b3ad9')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir"
}

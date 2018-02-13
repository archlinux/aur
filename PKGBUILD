# Maintainer : pianoslum <pianoslum@mailbox.org>

pkgname=gprof2dot
pkgver=2017.9.19
pkgrel=1
pkgdesc='A Python script to convert the output from many profilers into a dot graph.'
arch=('any')
url='https://github.com/jrfonseca/gprof2dot/'
license=('LGPL')
depends=('python' 'graphviz')
makedepends=('python-setuptools')
provides=(gprof2dot)
source=("https://pypi.python.org/packages/9d/36/f977122502979f3dfb50704979c9ed70e6b620787942b089bf1af15f5aba/${pkgname}-${pkgver}.tar.gz")
md5sums=('cda2d552bb0d0b9f16e6824a9aabd225')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir"
}

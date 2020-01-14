# Maintainer : pianoslum <pianoslum@mailbox.org>

pkgname=gprof2dot
pkgver=2019.11.30
pkgrel=1
pkgdesc='A Python script to convert the output from many profilers into a dot graph.'
arch=('any')
url='https://github.com/jrfonseca/gprof2dot/'
license=('LGPL')
depends=('python' 'graphviz')
makedepends=('python-setuptools')
provides=(gprof2dot)
source=("https://files.pythonhosted.org/packages/fd/77/3158821acc45cc26d5815d4250275d03c254572ff53c0388af8df168ce78/${pkgname}-${pkgver}.tar.gz")
md5sums=('c5e1b00db530b3edef1e1443022d26e7')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir"
}

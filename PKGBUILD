# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>

pkgname=python-pybloomfiltermmap3
_modname='pybloomfiltermmap3'
pkgver=0.4.15
pkgrel=1
pkgdesc="A Bloom filter (bloomfilter) for Python 3 built on mmap"
arch=('any')
url='https://github.com/PrashntS/pybloomfiltermmap3'
license=('MIT')
depends=('python')
makedepends=()
options=('!emptydirs')

source=("http://pypi.python.org/packages/source/p/${_modname}/${_modname}-${pkgver}.tar.gz")
md5sums=('020d7ca435bfc099851cd92947e6b0b3')

package() {
    cd ${srcdir}/${_modname}-${pkgver}
    python setup.py install --root=${pkgdir} --optimize=1
}

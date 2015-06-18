# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: MatToufoutu <mattoufootu[at]gmail.com>

pkgname=python2-pybloomfiltermmap
_modname='pybloomfiltermmap'
pkgver=0.3.12
pkgrel=1
pkgdesc="A Bloom filter (bloomfilter) for Python built on mmap"
arch=('any')
url='http://github.com/axiak/pybloomfiltermmap/'
license=('MIT')
depends=('python2')
makedepends=()
options=('!emptydirs')

conflicts=('python2-pybloomfiltermmap-git')
provides=('python2-pybloomfiltermmap')

#source=("http://pypi.python.org/packages/source/p/${_modname}/${_modname}-${pkgver}.tar.gz")
#sha512sums=('dfbec27d5b68338ef4f81eefb6c25adc2c151c78e800da5a579c7e98b695dd7916bca184aae1862857b2487e8908317d39728453a5cb5f156c1f67f63a6e8a05')
source=("https://github.com/axiak/pybloomfiltermmap/archive/release/0.3.12.tar.gz")
sha512sums=('515192b4a4ba3cc9619b3bbac234a372f1770c6bd101d49b07083493cbdc5bb3f74e974b89d0681407ab417682cf3bbe39f269341b4fd99707beb1849d418518')


package() {
    cd ${srcdir}/${_modname}-release-${pkgver}
    python2 setup.py install --root=${pkgdir} --optimize=1
}

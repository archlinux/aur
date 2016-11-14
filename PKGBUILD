# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: MatToufoutu <mattoufootu[at]gmail.com>

pkgname=python2-pybloomfiltermmap
_modname='pybloomfiltermmap'
pkgver=0.3.12
pkgrel=2
pkgdesc="A Bloom filter (bloomfilter) for Python built on mmap"
arch=('any')
url='http://github.com/axiak/pybloomfiltermmap/'
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
options=('!emptydirs')

conflicts=('python2-pybloomfiltermmap-git')
provides=('python2-pybloomfiltermmap')

source=("https://github.com/axiak/pybloomfiltermmap/archive/release/0.3.12.tar.gz")
sha512sums=('515192b4a4ba3cc9619b3bbac234a372f1770c6bd101d49b07083493cbdc5bb3f74e974b89d0681407ab417682cf3bbe39f269341b4fd99707beb1849d418518')

package() {
    cd ${srcdir}/${_modname}-release-${pkgver}
    python2 setup.py install --root=${pkgdir} --optimize=1
}

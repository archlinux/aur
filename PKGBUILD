# Maintainer: ael-code

pkgbase='python-zipstream'
pkgname=('python-zipstream' 'python2-zipstream')
pkgver=1.1.4
pkgrel=1
pkgdesc="zip archive generator for streaming purposes"
arch=(any)
url="https://github.com/allanlei/${pkgbase}"
license=('GPL3')
groups=()
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('18e2344412f3c46426e5df6cece33d6b')
sha256sums=('32a7a4bdb786914445589595273beffbbf9b6a0a3a3dc2cf19ea96114bd2abd7')

package_python-zipstream() {
      cd "$srcdir/${pkgbase}-${pkgver}"
      python setup.py install --root="$pkgdir/" --optimize=1
    }

package_python2-zipstream() {
      cd "$srcdir/${pkgbase}-${pkgver}"
      python2 setup.py install --root="$pkgdir/" --optimize=1
    }

# vim:set ts=2 sw=2 et:

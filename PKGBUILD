# Maintainer: ael-code

pkgbase='python-zipstream'
pkgname=('python-zipstream' 'python2-zipstream')
pkgver=1.1.3
pkgrel=1
pkgdesc="zip archive generator for streaming purposes"
arch=(any)
url="https://github.com/allanlei/${pkgbase}"
license=('GPL3')
groups=()
depends=()
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('69116ade494c3138f9fa7e877906d4996af5f440e88e9ffebe0948683b38ef23')

package_python-zipstream() {
      cd "$srcdir/${pkgbase}-${pkgver}"
      python2 setup.py install --root="$pkgdir/" --optimize=1
    }

package_python2-zipstream() {
      cd "$srcdir/${pkgbase}-${pkgver}"
      python2 setup.py install --root="$pkgdir/" --optimize=1
    }

# vim:set ts=2 sw=2 et:

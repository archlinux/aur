# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/soker90/paquetes-archinux.git
pkgname=python-odfpy
pkgver=1.4.0
pkgrel=1
pkgdesc="Python API and tools to manipulate OpenDocument files"
arch=('i686' 'x86_64')
url="https://github.com/eea/odfpy"
license=('Apache-2.0')
makedepends=('python-setuptools')
depends=('python')
conflicts=('odfpy' 'python-odfpy' 'python2-odfpy' 'python-all-odfpy')
source=("https://github.com/eea/odfpy/archive/release-$pkgver.tar.gz")
md5sums=('c5fe16c7379d9c894f33368f88ab0528')

package() {
      cd "$srcdir/odfpy-release-${pkgver}"
      python setup.py install --root=${pkgdir}
}

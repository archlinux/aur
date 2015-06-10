# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=python-cli
pkgver=2.0.3
pkgrel=2
pkgdesc='A framework for making simple, correct command line applications in Python. Also known as pyCLI.'
arch=('any')
url='https://github.com/whilp/cli'
license=('custom:ISC')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/whilp/cli/archive/v${pkgver}.tar.gz")
sha256sums=('66e54c2bb5e31f6d306679efe3297b020c14ce487e57e6a4bfac3f58033f782a')

package() {
  cd "${srcdir}/cli-$pkgver"
  python setup.py install --root=$pkgdir --prefix=/usr --optimize=1
}

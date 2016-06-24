# Maintainer: Andrejs Mivre??iks <gim at fastmail dot fm>
pkgname='python-cli'
pkgver='2.0.3'
pkgrel=3
pkgdesc='A framework for making simple, correct command line applications in Python. Also known as pyCLI.'
arch=('any')
url='https://github.com/whilp/cli'
license=('custom:ISC')
depends=('python')
makedepends=('python-pip' 'python2-pip')
source=("https://github.com/whilp/cli/archive/v2.0.3.tar.gz")
sha256sums=('66e54c2bb5e31f6d306679efe3297b020c14ce487e57e6a4bfac3f58033f782a')

package() {
  cd "${srcdir}/cli-$pkgver"
  echo :: Installing for python3.5 ...
  pip3 install --isolated --root="${pkgdir}" --no-deps --ignore-installed .
  echo :: Installing for python2.7 ...
  pip2 install --isolated --root="${pkgdir}" --no-deps --ignore-installed .
}

# Maintainer: pappy <pa314159@users.noreply.github.com>
pkgbase=python-sarge
pkgname=('python-sarge')
pkgver=0.1.7.post1
pkgrel=1
pkgdesc="The sarge package provides a wrapper for subprocess which provides command pipeline functionality."
arch=('any')
url="https://github.com/vsajip/sarge"
license=('BSD')
makedepends=('python')
source=("git+https://github.com/vsajip/sarge.git#tag=${pkgver}")
sha512sums=('5463ef6997feda11054849df31d53f29f085f93d76751198e52a960e33bf25bc528f01506a5cff63cbf19fa7bf7b47deff0708d6016033f46a5f90c40317356d')
depends=('python')
conflicts=('python-sarge-git')

package() {
  cd "${srcdir}/sarge"
  pip install --root="${pkgdir}" sarge
}

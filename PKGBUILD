# Maintainer: crab2313 <crab2313@gmail.com>

pkgname=python-gitlab
pkgver=1.8.0
pkgrel=1
pkgdesc="Python wrapper for the GitLab API"
arch=(any)
url="https://github.com/python-gitlab/python-gitlab"
license=('LGPLv3')
groups=()
depends=('python' 'python-requests' 'python-six')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(${url}/archive/${pkgver}.tar.gz)
md5sums=('d052327ad5af5fda51ce5e02b013f88c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

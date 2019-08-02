# Maintainer: crab2313 <crab2313@gmail.com>

pkgname=python-gitlab
pkgver=1.10.0
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
source=(${url}/archive/v${pkgver}.tar.gz)
md5sums=('4114634676922af357fb44fd4b106b6a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

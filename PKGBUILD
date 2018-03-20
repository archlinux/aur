# Maintainer: Xiangru Lian <xlian@gmx.com>

pkgname=python-gitlab
pkgver=1.3.0
pkgrel=1
pkgdesc="Interact with GitLab API"
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
md5sums=('c76c10eb12036239ca04a49b8d8daf52')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

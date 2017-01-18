# Maintainer: Xiangru Lian <xlian@gmx.com>

pkgname=python-gitlab
pkgver=0.18
pkgrel=1
pkgdesc="Interact with GitLab API"
arch=(any)
url="https://github.com/gpocentek/python-gitlab"
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
source=(https://github.com/gpocentek/python-gitlab/archive/${pkgver}.tar.gz)
md5sums=('68b8cefc5028e41dd1a564b211b15cb6')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

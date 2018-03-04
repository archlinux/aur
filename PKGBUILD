# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=blockstack-core
_name=blockstack
pkgver=0.18.0.0
pkgrel=1
pkgdesc=""
arch=('any')
url=""
license=('')
groups=()
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('57310ab73a79a1b5a4874abfa314637f')

package() {
	cd "$srcdir/$_name-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}

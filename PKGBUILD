# Maintainer: 5amu <v.casalino@protonmail.com>
pkgname=staresc
pkgver=2
pkgrel=6
_version="${pkgver}.${pkgrel}"
pkgdesc="Make SSH/TNT PTs Great Again!"
arch=( 'x86_64' )
url="https://github.com/staresc/staresc"
license=( 'GPLv3' )
depends=( 'python' 'python-paramiko' 'python-yaml' 'python-xlsxwriter' 'python-tabulate' 'python-tqdm')
source=("$pkgname-$_version.tar.gz::${url}/archive/refs/tags/v${_version}.tar.gz")
sha256sums=('SKIP')

package() {
	cd "$srcdir/$pkgname-$_version"
	python -m pip install --no-deps --root="$pkgdir" .
}

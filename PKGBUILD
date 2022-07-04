# Maintainer: 5amu <v.casalino@protonmail.com>
pkgname=staresc
pkgver=1
pkgrel=0
_version="${pkgver}.${pkgrel}"
pkgdesc="Make SSH/TNT PTs Great Again!"
arch=( 'x86_64' )
url="https://github.com/staresc/staresc"
license=( 'GPLv3' )
depends=( 'python' 'python-paramiko' 'python-yaml' 'python-xlsxwriter' 'python-tabulate')
source=("$pkgname-$_version.tar.gz::${url}/archive/refs/tags/v${_version}.tar.gz")
sha256sums=('3df2ed688ebab221cbdd5073bd94c7df9d24a4119ce9cd86d34c62bafdb32c23')

package() {
	cd "$srcdir/$pkgname-$_version"
	make prefix="$pkgdir" install
}

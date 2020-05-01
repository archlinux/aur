# Maintainer: Matteo Salonia <saloniamatteo@protonmail.com>

pkgname=memethesis-cli
pkgver=3.2.1
pkgrel=1
pkgdesc="Create memes from the terminal"
arch=('any')
url="https://github.com/fakefred/memethesis-cli"
license=('GPL3')
depends=('python>=3' 'imagemagick')
source=("https://github.com/fakefred/memethesis-cli/archive/3.2.1.tar.gz")
sha256sums=("3c0b1727bdc8e7c39885cdbfcdf6bc1daeae84b8be4780c756f053e42a37e31c")

package() {
	# go into memethesis-cli-3.2.1-1
	cd "${srcdir}/${pkgname}-${pkgver}"
	# install memethesis-cli; binary is in /usr/bin/memethesis
	python3 setup.py install --root="$pkgdir"
}

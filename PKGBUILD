# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: rich_o <rich_o@lavabit.com>
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Daniel YC Lin <dlin.tw at gmail>

pkgname=python-texttable
pkgver=0.8.3
pkgrel=1
pkgdesc="Generate a formatted text table using ASCII characters."
arch=('any')
url="https://pypi.python.org/pypi/texttable/"
license=('LGPL')
depends=('python')
options=('!emptydirs')
source=("https://pypi.python.org/packages/source/t/texttable/texttable-${pkgver}.tar.gz")
sha512sums=('d9a50f6fd9cd2a6d55afd5e686ac8ff2b2ebcf8c8041209ffae3e3864529c54a384840a65df2b87a942528005ca864d00bb01dfaeb33308843c01db7471931c8')

package() {
	cd "$srcdir/texttable-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}

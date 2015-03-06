# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: rich_o <rich_o@lavabit.com>
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Daniel YC Lin <dlin.tw at gmail>

pkgname=python-texttable
pkgver=0.8.2
pkgrel=1
pkgdesc="Generate a formatted text table using ASCII characters."
arch=('any')
url="https://pypi.python.org/pypi/texttable/"
license=('LGPL')
depends=('python')
options=('!emptydirs')
source=("https://pypi.python.org/packages/source/t/texttable/texttable-${pkgver}.tar.gz")
sha512sums=('af37f9bcbcf59e7887af612c36c93cb1cd98f5e724c2db91a81320d69d77aa662d5c0ed2e3dcd5a5f48c957e14682deae0fa7e026ecbc5f7803cc8bd151aeb28')

package() {
	cd "$srcdir/texttable-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}

# Maintainer : Kitestramuort <kitestramuort@autistici.org>

pkgname=python-sentinelsat
pkgver=1.1.1
pkgrel=1
pkgdesc="Search and download Copernicus Sentinel satellite images"
arch=('x86_64')
url="https://github.com/sentinelsat"
license=('GPL3')
depends=('python' 'python-pandas' 'python-geopandas' 'python-shapely' 'python-pytest-socket' 'python-pytest-vcr' 'python-yaml' 'rstcheck' 'python-sphinx' 'python-sphinx_rtd_theme' 'python-flaky' 'python-geomet')
provides=('python-sentinelsat')
source=("https://github.com/sentinelsat/sentinelsat/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('5deee310c0f5a0a108b9dad6e2260116')

package() {
	cd ${pkgname}-${pkgver}
	python setup.py install --root=${pkgdir} --optimize=1
}

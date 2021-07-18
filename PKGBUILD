_pkgname=python-uvicorn-loguru-integration
pkgname="${_pkgname}-git"
pkgver=0.5.3
pkgrel=1
pkgdesc='Code to integrate uvicorn.run with Loguru logging'
arch=('any')
url='https://github.com/MatthewScholefield/uvicorn-loguru-integration'
license=('MIT')
depends=('uvicorn' 'python-loguru')
makedepends=('python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url.git")
md5sums=("SKIP")

package() {
  cd "${srcdir}/uvicorn-loguru-integration"
  python setup.py install --root="$pkgdir" --optimize=1
}
# Maintainer: Joost Bremmer <toost dot b at gmail dot com>

pkgname=mackup
pkgver=0.8.11
pkgrel=1
pkgdesc="a small Python utitlity to keep your application settings in sync."
arch=('any')
url="https://github.com/lra/mackup"
license=('GPL3')
depends=('python2')

makedepends=(
			'python2'
			'python2-docopt'
			'python2-setuptools')

source=("https://github.com/lra/${pkgname}/archive/${pkgver}.tar.gz")

sha256sums=('a95ba796d4325ffc32f677a101972bfda18514ce0a3d629fa946e9165b8e1c28')



package() {
   cd $srcdir/${pkgname}-${pkgver}
   python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# Maintainer: Joost Bremmer <toost dot b at gmail dot com>

pkgname=mackup
pkgver=0.8.12
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

sha256sums=('f1ec65a4ec98b21e5b9fa6120e3f6e14c6d89cc6bf90123ac05e2befeb81ec25')



package() {
   cd $srcdir/${pkgname}-${pkgver}
   python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

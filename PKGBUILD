# Maintainer: Joost Bremmer <toost dot b at gmail dot com>

pkgname=mackup
pkgver=0.8.6
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

sha256sums=('2319e7a806337128e55f1dc531870f166f54c89531fb5f0fece4265f45c2a60c')



package() {
   cd $srcdir/${pkgname}-${pkgver}
   python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

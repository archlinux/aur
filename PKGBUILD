# Maintainer: Joost Bremmer <toost dot b at gmail dot com>

pkgname=mackup
pkgver=0.8.9
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

sha256sums=('9c8a9fe64446256cf86a116296105e2009e8e5c9421512962219690af7372741')



package() {
   cd $srcdir/${pkgname}-${pkgver}
   python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

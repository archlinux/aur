# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Roberto Catini <roberto.catini@gmail.com>

pkgname=python-twython
pkgver=3.5.0
pkgrel=1
pkgdesc="Pure Python wrapper for the Twitter API"
arch=('any')
url="https://github.com/ryanmcgrath/twython"
license=('MIT')
depends=('python-requests' 'python-requests-oauthlib')
options=(!emptydirs)

source=(https://pypi.python.org/packages/84/73/4dba8ad1e09e19252294d85f2958775aa3a968d78b4a23a74d776ba5bed7/twython-{$pkgver}.tar.gz)
sha256sums=('01ad5ed21f3da641a3dc58a814b435aac4cf91c691b1afc5a8dc0ca4e1affe47')

package() {
	cd "twython-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Roberto Catini <roberto.catini@gmail.com>

pkgname=python-twython
pkgver=3.4.0
pkgrel=1
pkgdesc="Pure Python wrapper for the Twitter API"
arch=('any')
url="https://github.com/ryanmcgrath/twython"
license=('MIT')
depends=('python-requests' 'python-requests-oauthlib')
options=(!emptydirs)

source=(https://github.com/ryanmcgrath/twython/archive/${pkgver}.tar.gz)
sha1sums=('0f70a315776813b5587a54701c4bd6725848b44e')

package() {
	cd "twython-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

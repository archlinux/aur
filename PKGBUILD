# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Roberto Catini <roberto.catini@gmail.com>

pkgname=python-twython
pkgver=3.2.0
pkgrel=1
pkgdesc="Pure Python wrapper for the Twitter API"
arch=('any')
url="https://github.com/ryanmcgrath/twython"
license=('MIT')
depends=('python-requests' 'python-requests-oauthlib')
options=(!emptydirs)

source=(https://pypi.python.org/packages/source/t/twython/twython-${pkgver}.tar.gz)
sha1sums=('1743ab480c1096d073ae4e9ff5a0e81f071fcfb9')

package() {
	cd "twython-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

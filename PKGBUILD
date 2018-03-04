# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Roberto Catini <roberto.catini@gmail.com>

pkgname=python-twython
pkgver=3.6.0
pkgrel=1
pkgdesc="Pure Python wrapper for the Twitter API"
arch=('any')
url="https://github.com/ryanmcgrath/twython"
license=('MIT')
depends=('python-requests' 'python-requests-oauthlib')
options=(!emptydirs)

source=(https://pypi.python.org/packages/88/33/31f588e972c9b39f937747b1e431239f50b59b18c97c9d24163d8a85df32/twython-${pkgver}.tar.gz)
sha256sums=('488908e38aeb843f2565e1e5c54378a6104beab3b1e12718bd69c0e44fa3c1c9')

package() {
	cd "twython-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Roberto Catini <roberto.catini@gmail.com>

pkgname=python-twython
pkgver=3.8.1
pkgrel=1
pkgdesc="Pure Python wrapper for the Twitter API"
arch=('any')
url="https://github.com/ryanmcgrath/twython"
license=('MIT')
depends=('python-requests' 'python-requests-oauthlib')
options=(!emptydirs)

source=(https://files.pythonhosted.org/packages/22/f9/892e6df43eeb53698b0a876470a072e6eba2a3310e1a1189cd7ec0d68a1d/twython-3.8.1.tar.gz)
sha256sums=('a7ea8c9955143ff9997c0b455b78d5cd607053393298186547649911f4e0c4f2')

package() {
	cd "twython-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

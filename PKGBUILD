# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Roberto Catini <roberto.catini@gmail.com>

pkgname=python-twython
pkgver=3.8.2
pkgrel=1
pkgdesc="Pure Python wrapper for the Twitter API"
arch=('any')
url="https://github.com/ryanmcgrath/twython"
license=('MIT')
depends=('python-requests' 'python-requests-oauthlib')
options=(!emptydirs)

source=(https://files.pythonhosted.org/packages/b7/2c/fb17cb309fccd4e63638715325768bd959b0ad78b23b0cbc0738f5fc8c58/twython-3.8.2.tar.gz)
sha256sums=('c6ca64309260e0ab47267f76217c80812f591991437f376fc61498816384f9e7')

package() {
	cd "twython-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

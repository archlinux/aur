# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Roberto Catini <roberto.catini@gmail.com>

pkgname=python-twython
pkgver=3.7.0
pkgrel=1
pkgdesc="Pure Python wrapper for the Twitter API"
arch=('any')
url="https://github.com/ryanmcgrath/twython"
license=('MIT')
depends=('python-requests' 'python-requests-oauthlib')
options=(!emptydirs)

source=(https://files.pythonhosted.org/packages/8c/2b/c0883f05b03a8e87787d56395d6c89515fe7e0bf80abd3778b6bb3a6873f/twython-${pkgver}.tar.gz)
sha256sums=('24ae29b4dd8d69df81707eb5fb7a1babd6689a3d69cd618f0647997d6179d338')

package() {
	cd "twython-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

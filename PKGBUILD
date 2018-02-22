# Maintainer: Nicolai.Pudimat <$maintainer@aol.de>
pkgname=maninex
pkgver=0.3
pkgrel=1
pkgdesc="Extension manager for Chromium-like browsers without the WebStore plugin"
arch=('any')
url="https://github.com/InspectorMustache/maninex"
license=('MIT')
depends=('python>=3.3.0'
         'python-requests'
         'python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/82/0a/cd28b1c311446d7b3c8c19af36448415e6477a63644b6a3a68d806436b84/$pkgname-$pkgver.tar.gz")
md5sums=('7be996184f64dd8add128000ecd8903e')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}

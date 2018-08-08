pkgname=python-flask-httpauth
pkgver=3.2.4
pkgrel=1
pkgdesc="Basic and Digest HTTP authentication for Flask routes"
url="https://github.com/miguelgrinberg/Flask-HTTPAuth"
license=('MIT')
arch=('any')
depends=('python' 'python-flask')
makedepends=('python-setuptools')
source=("https://github.com/miguelgrinberg/Flask-HTTPAuth/archive/v${pkgver}.tar.gz")

build() {
  cd "$srcdir/Flask-HTTPAuth-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/Flask-HTTPAuth-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('cb2c773aaee0e90d2fbfbea51ce31106')
sha1sums=('057599b9a604c65ba4352e000a81989db68c42bd')
sha256sums=('1c371ca35ea155b9725730f00db3e5b631006f6b2d9a419644c3d43c8567ec71')
sha384sums=('11e432648315be3974d7700c06850411fe0dc08d1373c0b6be6e2e54b6e8661357a6eff884a130bce876a499571f3c96')
sha512sums=('44b7baa75d929ce33e903670db6132e93fbc9ff50cbf826b65ef87bc0e03e3d47cd5a89382ccc1a48c7fe60aec55c189eef46e96c509ed09a4203060b4ad347c')

pkgname=python-flask-httpauth
pkgver=3.3.0
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

md5sums=('c84008dd605f2c8e443abefa95f9d787')
sha1sums=('fa720610013dca1f8e48233563a538794e638aaf')
sha256sums=('d0ee4c08eaff879a43be1b6a7f9efcbb38ceffbcda84da30979fcc8b9d037eaf')
sha384sums=('494b2e9526a5b7e86d30dc60eabb5e52795b7ef670c137fc7eee9ca973cef055d39d95327a57e149481d8113b98feff5')
sha512sums=('1303351a278799eb885afc9160d4569f73d13212cab2defbc818df6c39ad9284703da703f52c63fb032096a9773f429216e47cc26513730389585761b8f9953b')

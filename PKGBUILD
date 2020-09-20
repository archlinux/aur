# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

pkgname=python-awesometkinter
pkgver=2020.9.18
pkgrel=1
pkgdesc="Pretty tkinter widgets"
arch=('any')
url='https://github.com/Aboghazala/AwesomeTkinter'
license=('GPLv3')
depends=('python' 'tk' 'python-pillow')
source=('https://files.pythonhosted.org/packages/03/2c/e4f3f0c5d0b08cef416b5ba36a618a232cae8cfc607b1c1a5df7300c23ee/AwesomeTkinter-2020.9.18.tar.gz')
sha256sums=('f587c795034e7cec37ad1754712d8a301bff85bb60cd0f8308b643ce6bb3f049')

build() {
  cd "AwesomeTkinter-$pkgver"
  python setup.py build
}

package() {
  cd "AwesomeTkinter-$pkgver"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
}

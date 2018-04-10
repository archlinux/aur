# Contributor: Pieter Lenaerts <pieter dot aj dot lenaerts gmail>

pkgname=('python-jpegtran-cffi' 'python2-jpegtran-cffi')
pkgver=0.5.2
pkgrel=1
pkgdesc='Fast, (mostly) lossless JPEG transformations with Python'
arch=('any')
url='https://github.com/jbaiter/jpegtran-cffi'
license=('MIT')
source=("https://github.com/jbaiter/jpegtran-cffi/archive/v${pkgver}.tar.gz")
sha256sums=('1d5f10ca9dc86be8ca0ead2745e13b1c9e14f3812ebc4d90926a6836ec7fffc8')
depends=('libjpeg-turbo')

package_python-jpegtran-cffi() {
  makedepends=('python-setuptools')
  cd "$srcdir"/jpegtran-cffi-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}

package_python2-jpegtran-cffi() {
  makedepends=('python2-setuptools')
  cd "$srcdir"/jpegtran-cffi-$pkgver
	python2 setup.py install --root="$pkgdir" --optimize=1
	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=2 sw=2 et:

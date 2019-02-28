# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/soker90/paquetes-archinux.git
pkgname=python-lml
pkgver=0.0.9
pkgrel=1
pkgdesc="Load me later. A lazy loading plugin management system."
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('python-setuptools')
depends=('python')
source=("https://files.pythonhosted.org/packages/65/f3/3718c8b7b066731e8e60eaf42b1fd0d48d3539a6e7dbbdd4828be13c14ee/lml-0.0.9.tar.gz")
sha256sums=('ea5ba817b4adc9e9f5c21725cd2475f912933b7e2dfdf0792aed80077154f63f')

build() {
      cd "$srcdir/lml-${pkgver}"
      python setup.py build
}

package() {
      cd "$srcdir/lml-${pkgver}"
      python setup.py install --root=${pkgdir}
}

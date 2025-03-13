# Maintainer: hexa-01 <veilgen@proton.me>
pkgname=veilgen
pkgver=1.0.0
pkgrel=1
pkgdesc="A powerful tool for generating fake data for cybersecurity testing and development."
arch=('any')
url="https://github.com/hexa-01/Veilgen-Master"
license=('MIT')
depends=('python-rich' 'python-cryptography' 'python-faker')
source=("https://files.pythonhosted.org/packages/source/v/veilgen/veilgen-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/veilgen-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/veilgen-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

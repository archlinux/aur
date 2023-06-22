# Maintainer: tarneo <tarneo@tarneo.fr>
pkgname='python-pronotepy'
pkgver=2.10.0
pkgrel=1
pkgdesc='A Python API wrapper for the PRONOTE student administration service'
arch=('any')
url='https://github.com/bain3/pronotepy'
license=('MIT')
groups=()
depends=('python-autoslot' 'python-pycryptodome' 'python-requests' 'python-beautifulsoup4')
makedepends=('python-setuptools')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
sha256sums=('31b06b7e1b779a8ee33f2c15f0145af62da62d9233c1b4248bbbd86e6fdb4d7b')

_name='pronotepy'
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

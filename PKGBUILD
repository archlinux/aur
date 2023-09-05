# Maintainer: tarneo <tarneo@tarneo.fr>
pkgname='python-pronotepy'
pkgver=2.12.0
pkgrel=0
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
sha256sums=('1767f06b85d60ee084125663c0080954e7c47bc033047671ba335cf2e1297aa3')

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

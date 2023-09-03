# Maintainer: tarneo <tarneo@tarneo.fr>
pkgname='python-pronotepy'
pkgver=2.11.0
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
sha256sums=('42ecce1526036214df0facb3f121d78a9558432f10b17efb9ad8a16890977e60')

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

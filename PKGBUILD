# Maintainer: tarneo <tarneo@tarneo.fr>
pkgname='python-pronotepy'
pkgver=2.13.1
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
sha256sums=('9eb52b42d7e7804243e423ec5738411f2b428a0df152d3bb89eb1e845df786d4')

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

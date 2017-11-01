# Maintainer: Alexander Pohl <alex at ahpohl dot com>
pkgname=python-plotpot
pkgver=1.2.2
pkgrel=1
epoch=
pkgdesc="A python module for plotting potentiostat data"
arch=('any')
url="https://github.com/ahpohl/plotpot"
license=('MIT')
groups=()
depends=('python' 'convpot>=1.2.1' 'python-numpy' 'python-matplotlib')
makedepends=('python-setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+https://github.com/ahpohl/plotpot.git#tag=v${pkgver}")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

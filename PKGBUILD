# Maintainer: Ananas <ananas@ananas.moe>
pkgname=python-decouple
pkgver="3.8"
pkgrel=1
pkgdesc="Strict separation of config from code."
arch=("x86_64" "i686")
url="https://github.com/HBNetwork/python-decouple"
license=("MIT")
makedepends=('python-setuptools')
depends=(
	"python"
)
optdepends=()
checkdepends=()
provides=("python-decouple")
conflicts=(	)
md5sums=("SKIP")
source=(
	"${pkgname}-${pkgver}.zip::https://github.com/HBNetwork/python-decouple/archive/refs/tags/v$pkgver.zip"
)

build() {
    cd $pkgname-$pkgver
    python setup.py build
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
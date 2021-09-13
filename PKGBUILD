# Maintainer: Samuel Sloniker <sam@kj7rrv.com>

pkgname=wormpy
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="bsdgames worm, ported to Python and improved"
arch=('any')
url="https://github.com/kj7rrv/wormpy"
license=('MIT')
groups=()
depends=('python-blessings' 'python-timeout-decorator')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/kj7rrv/wormpy/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('458b983498b4af308b5518860c5411c55f8e7061115e2c1a46097413fc3d2129')
validpgpkeys=()

prepare() {
	:
}

build() {
	:
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p $pkgdir/usr
	bash ./install.sh $pkgdir/usr /usr
}

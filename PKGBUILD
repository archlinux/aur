# Maintainer: ChickenJockey7
pkgname=squish
pkgver=1.2.0
pkgrel=1
pkgdesc="A fast, lightweight Unix shell written in Cpp"
arch=('x86_64')
url="https://gitlab.com/cpp4692517/shell"
license=('MIT')
makedepends=('git' 'xmake' 'lua54')
depends=('lua54')
source=("git+https://gitlab.com/cpp4692517/shell.git")
sha256sums=('SKIP')

build() {
    cd shell
    xmake   
}

package() {
    cd shell
    xmake install --root --installdir="$pkgdir/usr"
    install -Dm644 LICENCE \
	"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    	
}

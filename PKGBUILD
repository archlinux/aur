# Maintainer: Wil Thomason <wbthomason@cs.cornell.edu>
pkgname=gonvim
pkgver=0.1
pkgrel=3
pkgdesc="Neovim GUI written in Golang"
arch=('any')
url="https://github.com/dzhou121/gonvim"
license=('unknown')
depends=('neovim' 'qt5-base' 'qt5-tools' 'qt5-multimedia' 'qt5-svg' 'qt5-declarative')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/dzhou121/gonvim/releases/download/v${pkgver}/gonvim-linux.zip")
sha256sums=('a0869e5e72a567a12b0f3a7cc3c7ce4d7d436824f1bb8ecce56c57c0fdb03a62')

package() {
    cd ${pkgname}
	install -Dm 755 "$srcdir/${pkgname}/${pkgname}" -t "$pkgdir/usr/bin/"
}

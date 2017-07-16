# Maintainer: Wil Thomason <wbthomason@cs.cornell.edu>
pkgname=gonvim
pkgver=0.1
pkgrel=5
pkgdesc="Neovim GUI written in Golang"
arch=('any')
url="https://github.com/dzhou121/gonvim"
license=('unknown')
depends=('neovim' 'qt5-base' 'qt5-tools' 'qt5-multimedia' 'qt5-svg' 'qt5-declarative')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/dzhou121/gonvim/releases/download/nightly/gonvim-linux.zip")
sha256sums=('be051b4cd43751f5009d146ec133c9537165a0fc80241d4f314e4bf3622f4b28')

package() {
    cd ${pkgname}
	install -Dm 755 "$srcdir/${pkgname}/${pkgname}" -t "$pkgdir/usr/bin/"
}

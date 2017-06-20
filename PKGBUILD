# Maintainer: Wil Thomason <wbthomason@cs.cornell.edu>
pkgname=gonvim
pkgver=0.1
pkgrel=1
pkgdesc="Neovim GUI written in Golang"
arch=('any')
url="https://github.com/dzhou121/gonvim"
license=('unknown')
depends=('neovim' 'qt5-base')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/dzhou121/gonvim/releases/download/v${pkgver}/gonvim-linux.zip")
sha256sums=('efbc78c8a09c164caec7e1149d0d5d4f3cb772b200883fefcc7eb354fcd32cc9')

package() {
    cd ${pkgname}
	install -Dm 755 "$srcdir/${pkgname}/${pkgname}" -t "$pkgdir/usr/bin/"
}

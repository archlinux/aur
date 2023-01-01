# Maintainer: nshan651 <nshan651@aur.archlinux.org>
pkgname=excite-cli
pkgver=v0.2.0_alpha
pkgrel=1
pkgdesc="A Terminal-Based Citation Generator"
arch=('x86_64')
url="git+https://github.com/nshan651/excite-cli"
license=('GPL3')
depends=('lua>=5.1' 'json-lua' 'argparse' 'lua-curl') 
makedepends=('busted>=2.1')
source=("$url")
md5sums=('SKIP')

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" install
}

# Maintainer: Felipe Chierice <byomess@proton.me>

pkgname=lst-git
pkgver=latest
pkgrel=1
pkgdesc="Improved ls command for Unix-like systems."
arch=('any')
url="http://github.com/byomess/${pkgname%-git}"
license=('MIT')
depends=('git' 'python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("https://github.com/byomess/lst.git#branch=main")

build() {
    cd "$pkgname"
    ./setup.sh
}

package() {
    cd "$pkgname"
    ./install.sh --path="$HOME/.local/share" --bin-path="$HOME/.local/bin"
}

sha256sums=('SKIP') 

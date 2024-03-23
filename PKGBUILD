# Maintainer: Felipe Chierice <byomess@proton.me>

pkgname=lst-git
pkgver='1.0'
pkgrel=1
pkgdesc="Improved ls command for Unix-like systems."
arch=('any')
url="http://github.com/byomess/${pkgname%-git}"
license=('MIT')
depends=('git' 'python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/byomess/lst")

build() {
    cd "${pkgname%-git}"
    ./setup.sh
}

package() {
    cd "${pkgname%-git}"
    ./install.sh --path="$HOME/.local/share" --bin-path="$HOME/.local/bin"
}

sha256sums=('SKIP') 

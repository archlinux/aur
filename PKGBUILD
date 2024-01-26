# Maintainer: Murli Tawari <kraanzu@gmail.com>

pkgname=smassh
_pkgname=${pkgname}
pkgver=3.0.1
pkgrel=1
pkgdesc="Smassh your Keyboard, TUI Edition"
url="https://github.com/kraanzu/smassh"
arch=('any')
license=('GPL-3.0')
depends=('python' 'git' 'xclip')
makedepends=()
source=("https://github.com/kraanzu/dooit/releases/download/v${pkgver}/linux-smassh")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}"
    chmod +x linux-smassh
    mv linux-smassh smassh
}

package() {
    install -Dm0755 "$pkgname" "$pkgdir/usr/bin/smassh"
}


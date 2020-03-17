# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=pacfetch
pkgver=1.0.7
pkgrel=1
pkgdesc="Simple fetch script for pacman based distros. Written in Rust."
url="https://git.auteiy.me/dmitry/pacFetch"
license=('GPL3')
depends=(
    gcc-libs
)

source=("pacfetch-v$pkgver::https://github.com/auteiy/pacfetch/releases/download/v$pkgver/pacfetch-v$pkgver-linux-x64")

# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('613cc8f47748f1997f5744e8dcb695924403f12446c76119437b45cf7210f0e4ff1844b6b9cf20b81bc4e91683c71094f92c967218c6a162e9e139653fb44f2b')

arch=('x86_64')

package() {
    install -D "$srcdir/pacfetch-v$pkgver" "$pkgdir/usr/bin/pacfetch"
}

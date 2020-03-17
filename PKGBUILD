# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=pacfetch
pkgver=1.0.8
pkgrel=1
pkgdesc="Simple fetch script for pacman based distros. Written in Rust."
url="https://git.auteiy.me/dmitry/pacFetch"
license=('GPL3')
depends=(
    gcc-libs
)

source=("pacfetch-v$pkgver::https://github.com/auteiy/pacfetch/releases/download/v$pkgver/pacfetch-v$pkgver-linux-x64")

# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('d4e175c38b13a9263b2f1fd9fb01c12b18b77224a03cf58ebe56e14a03848f5084f1bbbe1a82272d2fd18233d713338b8db806c756d091be5253739c29b2f99a')

arch=('x86_64')

package() {
    install -D "$srcdir/pacfetch-v$pkgver" "$pkgdir/usr/bin/pacfetch"
}

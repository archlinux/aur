# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=pacfetch
pkgver=1.0.4.10
pkgrel=1
pkgdesc="Simple fetch script for pacman based distros. Written in Rust."
url="https://git.auteiy.me/dmitry/pacFetch"
license=('GPL3')
depends=(
    gcc-libs
)

source=("pacfetch::https://github.com/auteiy/pacfetch/releases/download/v$pkgver/pacfetch-v$pkgver-linux-x64")

# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('90b014b466163d4b9c5253deea72c4b23424223e4b12990a104e2644460a00a4ac9b148db72f08096007ace237a1cb684731c86f86669eff94e71ec66385bbd8')

arch=('x86_64')

package() {
    install -D "$srcdir/pacfetch" "$pkgdir/usr/bin/pacfetch"
}

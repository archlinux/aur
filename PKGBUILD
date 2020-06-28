# Maintainer: Ykkzde <dmitry@ykkz.de>

pkgname=random-case-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="Simple fetch script for pacman based distros. Written in Rust."
url="https://gitlab.com/ykkzde/random-case"
license=('GPL3')
provides=('random-case')
conflicts=('random-case-git')
depends=(
    gcc-libs
)

source=("random-case-$pkgver::https://github.com/ykkzde/random-case/releases/download/$pkgver/random-case-$pkgver-linux-x64")

# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('bdb3dc93007ec2d80bee0aea430d4a249188bd82fc746585fff95528c51803a0da286eb8f013a5d04dd1fc4eda2e615dcb7cfcd1a160b316ac7f7f7f603f6241')

arch=('x86_64')

package() {
    install -D "$srcdir/random-case-$pkgver" "$pkgdir/usr/bin/random-case"
}

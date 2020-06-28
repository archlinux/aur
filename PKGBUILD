# Maintainer: Ykkzde <dmitry@ykkz.de>

pkgname=random-case-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="Randize case of your input text. Totally useless, but written in Rust."
url="https://gitlab.com/ykkzde/random-case"
license=('GPL3')
provides=('random-case')
conflicts=('random-case-git')
depends=(
    gcc-libs
)

source=("random-case-$pkgver::https://github.com/ykkzde/random-case/releases/download/v$pkgver/random-case-v$pkgver-linux-x64")

# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('8a67f4d99aedac440cd58c5d916ed1dfcec199629cfb7474e65fe17cad41ad860a5027268a0e32ee15c02ab2142a24b3d0cedd35990a35f33fb67c3393606040')

arch=('x86_64')

package() {
    install -D "$srcdir/random-case-$pkgver" "$pkgdir/usr/bin/random-case"
}

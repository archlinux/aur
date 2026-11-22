# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: SeekyCt <seeky dot mkw at gmail dot com>
pkgname=wibo-bin
pkgver=1.2.0
pkgrel=1
epoch=
pkgdesc="A minimal, low-fuss wrapper that can run simple command-line 32-bit Windows binaries on Linux and macOS."
arch=('x86_64')
url="https://github.com/decompals/wibo"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('wibo')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver::https://github.com/decompals/wibo/releases/download/$pkgver/wibo-x86_64")
noextract=()
sha256sums=('13f86a2d618f0dbe67179d349625345eabf9b46450295cb4c904e49f6aff85af')
validpgpkeys=()

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/wibo"
}


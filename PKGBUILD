# Maintainer: aik2 <aik2mlj@gmail.com>
#
pkgname=basalt-bin
_name=basalt
pkgver=0.13.0
pkgrel=1
pkgdesc="TUI Application to manage Obsidian vaults and notes directly from the terminal"
arch=('x86_64')
url="https://github.com/erikjuhani/basalt"
license=('MIT')
provides=($_name)
conflicts=($_name)
source=("${url}/releases/download/${_name}%2Fv${pkgver}/${_name}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('975e540eba4bef766dd7a728e643731f833ed2149e6068fa1bee5756c7f541af')

package() {
    # Install the binary
    install -Dm755 "$srcdir/$_name-$pkgver-x86_64-unknown-linux-gnu/$_name" "$pkgdir/usr/bin/$_name"
}

# Maintainer: aik2 <aik2mlj@gmail.com>
#
pkgname=basalt-bin
_name=basalt
pkgver=0.12.7
pkgrel=2
pkgdesc="TUI Application to manage Obsidian vaults and notes directly from the terminal"
arch=('x86_64')
url="https://github.com/erikjuhani/basalt"
license=('MIT')
provides=($_name)
conflicts=($_name)
source=("${url}/releases/download/${_name}%2Fv${pkgver}/${_name}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('9db8679eac68eb6d84ca1c1b7b0e23351a61c2bda34c7d3652b325554c3f52d7')

package() {
    # Install the binary
    install -Dm755 "$srcdir/$_name-$pkgver-x86_64-unknown-linux-gnu/$_name" "$pkgdir/usr/bin/$_name"
}

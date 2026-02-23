# Maintainer: aik2 <aik2mlj@gmail.com>
#
pkgname=basalt-bin
_name=basalt
pkgver=0.12.2
pkgrel=1
pkgdesc="TUI Application to manage Obsidian vaults and notes directly from the terminal"
arch=('x86_64')
url="https://github.com/erikjuhani/basalt"
license=('MIT')
provides=($_name)
conflicts=($_name)
source=("${url}/releases/download/${_name}%2Fv${pkgver}/${_name}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('070e24f0be7dd70f10aba665420aea1f21a0dee6b6ebaef507cfa94a26566d34')

package() {
    # Install the binary
    install -Dm755 "$srcdir/target/x86_64-unknown-linux-gnu/release/$_name" "$pkgdir/usr/bin/$_name"
}

# Maintainer: shanoaice <shanoaice at tutamail dot com>
pkgname=air-language-server-bin
pkgver=0.9.0
pkgrel=2
epoch=
pkgdesc="R formatter and language server"
arch=('x86_64' 'aarch64')
url="https://posit-dev.github.io/air/"
license=('MIT')
groups=()
depends=('r')
makedepends=()
checkdepends=()
optdepends=()
provides=(air-language-server)
conflicts=(air-language-server)
replaces=()

source_x86_64=("https://github.com/posit-dev/air/releases/download/$pkgver/air-x86_64-unknown-linux-gnu.tar.gz")
b2sums_x86_64=('1554ec4db2ff85fc43c59b8875f8a8a06210ff84e0ea916711c2093de16987b0ddf96463fad089ba1c66ec232713d7ce53f0388e04a1aaeba44ea799cf453a73')

source_aarch64=("https://github.com/posit-dev/air/releases/download/$pkgver/air-aarch64-unknown-linux-gnu.tar.gz")
b2sums_aarch64=('9419c1d2aeb161f9d21134b218d126529e65bae2b946bc649f29e086a3aae9405ad4485616e863691ab044f60623161f8b82f5286deafccd3fc8f5bf970e4f9d')

package() {
	cd "$srcdir/air-$CARCH-unknown-linux-gnu"
	install -Dm755 air $pkgdir/usr/bin/air
}

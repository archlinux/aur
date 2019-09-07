# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=binfmt-wasm
pkgver=20190907
pkgrel=1
pkgdesc="Register wasmtime interpreter for wasm format"
arch=('any')
url="http://www.freedesktop.org/software/systemd/man/binfmt.d.html"
license=('MPL2')
depends=('wasmtime')
source=("wasm.conf")
sha384sums=('a7f7237a20bfd41484e6abfe1d5224cdd6ca1f7e563c04ef8b80c0a7e9893c2a5d6a34876e85ef7275d06ae7c9242c23')

package() {
    install -Dm 644 "$srcdir/wasm.conf" "$pkgdir/usr/lib/binfmt.d/wasm.conf"
}

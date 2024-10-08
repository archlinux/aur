pkgname=wasm-lsp-server-bin
pkgver=0.0.0
pkgrel=1
pkgdesc="A language server for WebAssembly"
arch=(x86_64)
url=https://github.com/wasm-lsp/wasm-lsp-server
license=(GPL3)
provides=(wasm-lsp-server)
conflicts=(wasm-lsp-server)
source=("$url/releases/download/v0.0.0-prerelease/wasm-lsp-linux.zip")
sha256sums=('ee64d4405457df7a857084229bccb503343cde7ff07df10a0d2d862dddb5a5ef')

package() {
	install -D $srcdir/wasm-lsp -t $pkgdir/usr/bin
}

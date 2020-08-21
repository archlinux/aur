# Maintainer: relrel <relrelbachar@gmail.com>

pkgname=mojom-lsp
pkgver=0.1.1
pkgrel=1
pkgdesc="A language server for Mojom IDL"
arch=('any')
url="https://github.com/GoogleChromeLabs/mojom-language-support"
license=('Apache')
makedepends=(rust)

package() {
	cargo install --no-track --locked --root "$pkgdir/usr/" $pkgname
}

# Maintainer: agony <27015 at riseup dot net>

pkgname=phpantom_lsp-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Fast PHP language server with deep type intelligence (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/PHPantom-dev/phpantom_lsp'
license=('MIT')
provides=("phpantom_lsp=${pkgver}")
conflicts=('phpantom_lsp')
_release="${url}/releases/download/${pkgver}"
source=("phpantom_lsp-${pkgver}-LICENSE::https://raw.githubusercontent.com/PHPantom-dev/phpantom_lsp/${pkgver}/LICENSE")
source_x86_64=("phpantom_lsp-${pkgver}-x86_64.tar.gz::${_release}/phpantom_lsp-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("phpantom_lsp-${pkgver}-aarch64.tar.gz::${_release}/phpantom_lsp-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('0558c8ee80c9eacd4168299a3e6479b65287353a691a107a8681575f0b038dca')
sha256sums_x86_64=('1fffb616066988a3f5fd17cf012c5f79ce5b6c2dfaee62960839607299fc2906')
sha256sums_aarch64=('a95fb1cea746992f2b8570e1b7f4f6a5fdf0a294ebe7a9e891252c2a835ff326')

package() {
  install -Dm755 phpantom_lsp -t "${pkgdir}/usr/bin"
  install -Dm644 "phpantom_lsp-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

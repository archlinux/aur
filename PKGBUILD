# Maintainer: agony <27015 at riseup dot net>

pkgname=phpantom_lsp-bin
pkgver=1.1.0
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
sha256sums_x86_64=('f374e72ebd51d5e991bb0e7e395ec3a49b3dc75f101e69e4743f908515e9d7e7')
sha256sums_aarch64=('888633fd40b9af4709338af7cc76a34e9096f4259812cd24911109af1d068c5f')

package() {
  install -Dm755 phpantom_lsp -t "${pkgdir}/usr/bin"
  install -Dm644 "phpantom_lsp-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

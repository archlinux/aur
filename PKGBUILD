# Maintainer: fatuus
pkgname=luau-lsp-bin
pkgver=1.69.0
pkgrel=1
pkgdesc="Language Server Implementation for Luau"
arch=('x86_64' 'aarch64')
url="https://github.com/JohnnyMorganz/luau-lsp"
license=('MIT')
depends=('libstdc++' 'libgcc' 'glibc')
makedepends=('unzip')
source_x86_64=("https://github.com/JohnnyMorganz/luau-lsp/releases/download/${pkgver}/luau-lsp-linux-x86_64.zip")
source_aarch64=("https://github.com/JohnnyMorganz/luau-lsp/releases/download/$pkgver/luau-lsp-linux-arm64.zip")
source=('https://raw.githubusercontent.com/JohnnyMorganz/luau-lsp/refs/heads/main/LICENSE.md')
sha256sums=('5bf374ce7ab54c8d75f14e21f04932cae10708189afaec95321aed1a47701935')
sha256sums_x86_64=('4457aeb690d3c22e04567f38c6259ac259a1673ec022758b9cb81af2a0e66c41')
sha256sums_aarch64=('b0c78fe40defe71b9fa6381390a590f2040897980a0cf31f0a23c165ad27ebbb')

package() {
 # _output="${srcdir}/${pkgname/-bin/}_${CARCH}"
  install -Dm755 "${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
}

# Maintainer: fatuus
pkgname=luau-lsp-bin
pkgver=1.68.1
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
sha256sums_x86_64=('ddb5fe8fd503bbcb76ee439fbd6522efbfe9f0098be5a233401e493c579fc4a9')
sha256sums_aarch64=('4ab4906dee6041ec23a8b0abdd81c1fdbd770c8c2dcb931e39a33f6790d779f3')

package() {
 # _output="${srcdir}/${pkgname/-bin/}_${CARCH}"
  install -Dm755 "${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
}

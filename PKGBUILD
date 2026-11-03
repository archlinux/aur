# Maintainer: Rumato Estorsky <@rumatoest at x.com>
pkgname=xepak
pkgdesc="Declarative REST,RPC,MCP server builder. TOML-backed DSL with optional Lua scripting. SQLite-based."
url="https://github.com/rustrum/xepak"
pkgrel=1
arch=('x86_64' 'aarch64')
license=('MIT')

pkgver="0.0.10_rc"
_tag="v0.0.10-rc"
# _tag="v${pkgver}"

provides=('xepak')
depends=()
conflicts=()

source_x86_64=(
    "https://github.com/rustrum/xepak/releases/download/${_tag}/xepak-x86_64-unknown-linux-gnu.tar.gz"
)
source_aarch64=(
    "https://github.com/rustrum/xepak/releases/download/${_tag}/xepak-aarch64-unknown-linux-gnu.tar.gz"
)

# Architecture-specific checksums
sha256sums_x86_64=('f0da9e7470407ecb7314fb18f790d04d305ce8d5d46d1552e0134ce8831f0639')
sha256sums_aarch64=('0e5bfaf89b0af7449df69b27908385e3849cccb1356ade0124c7535f66703816')

package() {
  cd "${srcdir}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# Maintainer: Rumato Estorsky <@rumatoest at x.com>
pkgname=xepak
pkgdesc="Declarative REST,RPC,MCP server builder. TOML-backed DSL with optional Lua scripting. SQLite-based."
url="https://github.com/rustrum/xepak"
pkgrel=1
arch=('x86_64' 'aarch64')
license=('MIT')

pkgver="0.1.0"
_tag="v${pkgver}"

provides=('xepak')
depends=()
conflicts=()

source_x86_64=(
    "xepak-x86_64-${_tag}.tar.gz::https://github.com/rustrum/xepak/releases/download/${_tag}/xepak-x86_64-unknown-linux-gnu.tar.gz"
)
source_aarch64=(
    "xepak-aarch64-${_tag}.tar.gz::https://github.com/rustrum/xepak/releases/download/${_tag}/xepak-aarch64-unknown-linux-gnu.tar.gz"
)

# Architecture-specific checksums
sha256sums_x86_64=('0f991aff164fdfb693e41d95b4c26b9cb1c78d639757f922fa03aaa746ec2ade')
sha256sums_aarch64=('f0d9939c8a7f5be73a6cb48b1f58a20657dcab6eef1331b7294caa9181b315a2')

package() {
  cd "${srcdir}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

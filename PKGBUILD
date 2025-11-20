# Maintainer: Denys Sedchenko <aur@x1unix.dev>
pkgname=codex-acp
_realname=codex-acp
pkgver='0.5.0'
pkgrel=1
pkgdesc="ACP adapter for OpenAI Codex"
arch=('x86_64' 'aarch64')
url="https://github.com/zed-industries/codex-acp"
license=('Apache-2.0')
provides=("${_realname}")
conflicts=("${_realname}")
depends=(
  'openai-codex'
)
makedepends=()
optdepends=()

source_x86_64=("${_realname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/${_realname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_realname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/${_realname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('0b02cc71639138d96deb1e13851caade10df85053ffb92a5fa3e9e8d7bf06509')
sha256sums_aarch64=('c2a51db81e11a881f415c69f0bc609095ffa224890d2eb8dbd612ac85a79591b')

package() {
  install -Dm755 "$srcdir/${_realname}" "${pkgdir}/usr/bin/${_realname}"
}

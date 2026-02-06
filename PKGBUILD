# Maintainer: Denys Sedchenko <aur@x1unix.dev>
pkgname=codex-acp
_realname=codex-acp
pkgver='0.9.2'
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
options=('!debug')
makedepends=()
optdepends=()

source_x86_64=("${_realname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/${_realname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_realname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/${_realname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('59531026a0542a4ca9f18d73b445c20ab36d4882dda145c4ab27a4a46196d1ad')
sha256sums_aarch64=('52ef6fa1ccae7b9e102cff9ee20d7abe7498ee22d1219dc8e1858a75f60f757c')

package() {
  install -Dm755 "$srcdir/${_realname}" "${pkgdir}/usr/bin/${_realname}"
}

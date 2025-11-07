# Maintainer: Denys Sedchenko <aur@x1unix.dev>
pkgname=codex-acp
_realname=codex-acp
pkgver='0.3.14'
pkgrel=3
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

sha256sums_x86_64=('61b31b7125c1a469064e07a35ced5ce26b500cb789f93adc98503bfc5b53e54a')
sha256sums_aarch64=('0e4043c9c04f3bd1afa88c4c0685ed7004215974a631b21481faa582a7e79a94')

package() {
  install -Dm755 "$srcdir/${_realname}" "${pkgdir}/usr/bin/${_realname}"
}

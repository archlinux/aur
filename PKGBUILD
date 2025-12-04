# Maintainer: Denys Sedchenko <aur@x1unix.dev>
pkgname=codex-acp
_realname=codex-acp
pkgver='0.6.0'
pkgrel=2
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

sha256sums_x86_64=('4ec913ab92f83128be00d1ca5fc8166ebc21ea9b4a8b855e884bbadef64ec0f0')
sha256sums_aarch64=('7d345ff2448dd0628161c0c4d40f86985e67f851dd0874f13e5335c1a78eae35')

package() {
  install -Dm755 "$srcdir/${_realname}" "${pkgdir}/usr/bin/${_realname}"
}

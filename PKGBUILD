# Maintainer: Denys Sedchenko <aur@x1unix.dev>
pkgname=codex-acp
_realname=codex-acp
pkgver='0.7.1'
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

sha256sums_x86_64=('4b85510e0be3ab1fe0b4782429a46127ccc4a0f71aad6c05254e745db8e42145')
sha256sums_aarch64=('dc012fd153ed6cf16632eab8fee0caaa0b4a6bba510440e6aaa01f6813b96a1c')

package() {
  install -Dm755 "$srcdir/${_realname}" "${pkgdir}/usr/bin/${_realname}"
}

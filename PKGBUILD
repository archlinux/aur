# Maintainer: Luka Kuuhaku <contato+git@lukakuuhaku.dev>
pkgname=xclaudeusage-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Claude Code statusline + per-turn token recorder with optional multi-device sync (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/SrDarf/XClaudeUsage"
license=('MIT')
provides=('xclaudeusage')
conflicts=('xclaudeusage')
options=('!strip')
install=${pkgname}.install
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
sha256sums=('807c2813536386720f6b3a30bc9f6d7b91111a5b5cfd55922a9223b3bd260193')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/xclaudeusage-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a837a284077eca2d62c047fbc6f82af74dbb72ba285ef9fab6e222bee91a1ca0')
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/xclaudeusage-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('5bd01963486cc3a164b3a67f3fbd6c42520995d5673f3415805c96e06a605d73')

package() {
  install -Dm755 "${srcdir}/xclaudeusage" "${pkgdir}/usr/bin/xclaudeusage"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

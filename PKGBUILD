# Maintainer: Luka Kuuhaku <contato+git@lukakuuhaku.dev>
pkgname=xclaudeusage-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Claude Code statusline + per-turn token recorder with optional multi-device sync (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/SrDarf/XClaudeUsage"
license=('MIT')
provides=('xclaudeusage')
conflicts=('xclaudeusage')
options=('!strip')
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
sha256sums=('807c2813536386720f6b3a30bc9f6d7b91111a5b5cfd55922a9223b3bd260193')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/xclaudeusage-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('81c56bbc364c9ed6b7b0f70088c6f586e11a539e7d282e59edeefc870bf12ae0')
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/xclaudeusage-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('1118c28b177ee7e007ba963f9e416e1f52061f4e0da25bd4763770365222d6dc')

package() {
  install -Dm755 "${srcdir}/xclaudeusage" "${pkgdir}/usr/bin/xclaudeusage"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

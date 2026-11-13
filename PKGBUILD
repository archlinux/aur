# Maintainer: Luka Kuuhaku <contato+git@lukakuuhaku.dev>
pkgname=xclaudeusage-bin
pkgver=0.1.8
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
sha256sums_x86_64=('6bad17aff1d3c0cec23502748bbd3f282285e23e83fea04ad3730108b9a76bf6')
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/xclaudeusage-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('9e456ac3c9cbc5b98b7506b6e6d1890486f758768449b95f58f1b8ece76ca5d7')

package() {
  install -Dm755 "${srcdir}/xclaudeusage" "${pkgdir}/usr/bin/xclaudeusage"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

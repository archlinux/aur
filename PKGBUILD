# Maintainer: Luka Kuuhaku <contato+git@lukakuuhaku.dev>
pkgname=xclaudeusage-bin
pkgver=0.1.5
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
sha256sums_x86_64=('5592015be4f25e664b8f1dee26d39b7c402c8a2b1790b7ce00b26d03e52b1f04')
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/xclaudeusage-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('1d72c34dff1d594492f94df288e5ff9002f52a34647cf1d98974b936a03a53bc')

package() {
  install -Dm755 "${srcdir}/xclaudeusage" "${pkgdir}/usr/bin/xclaudeusage"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

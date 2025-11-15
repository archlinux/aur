# Reference copy - actual PKGBUILD lives at ssh://aur@aur.archlinux.org/waybar-claude-code-bin.git
# Maintainer: hxreborn <https://github.com/hxreborn>

pkgname=waybar-claude-code-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Waybar module that shows Claude Code usage stats via ccusage"
arch=('x86_64' 'aarch64')
url="https://github.com/hxreborn/waybar-claude-code"
license=('MIT')
depends=()
provides=('waybar-claude-code')
conflicts=('waybar-claude-code')

source_x86_64=("${url}/releases/download/v${pkgver}/waybar-claude-code-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/waybar-claude-code-v${pkgver}-linux-arm64.tar.gz")

sha256sums_x86_64=('14ed6b034753518e49fdaeed5f1f464a71682c00bc8e6c56e73369b1029155fb')
sha256sums_aarch64=('8e52e8d12b7689ffcf86e90c73dae6bb7bc2298b2a30c4056c61cecc1e574ca8')

# noextract=() stays empty - extraction is needed

package() {
  install -Dm755 waybar-claude-code "${pkgdir}/usr/bin/waybar-claude-code"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Hunter Bow <hmbown@gmail.com>
# Contributor: DeepSeek TUI by Hmbown <https://github.com/Hmbown/DeepSeek-TUI>

pkgname=deepseek-tui-bin
pkgver=0.6.5
pkgrel=1
pkgdesc="A terminal coding agent for DeepSeek models with file editing, shell execution, web browsing, git operations, and MCP server integration"
arch=('x86_64')
url="https://github.com/Hmbown/DeepSeek-TUI"
license=('MIT')
depends=('openssl' 'brotli' 'zstd')
provides=('deepseek-tui')
conflicts=('deepseek-tui')
source=("https://github.com/Hmbown/DeepSeek-TUI/releases/download/v${pkgver}/deepseek-tui-linux-x64")
sha256sums=('e63aa11a3228f7e74f073ef5a1d804fe7497e662a88efa5793745a322e9aaabe')

package() {
  cd "${srcdir}"
  install -Dm755 "deepseek-tui-linux-x64" "${pkgdir}/usr/bin/deepseek-tui"
}

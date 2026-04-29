# Maintainer: Hunter Bow <hmbown@gmail.com>
# Contributor: DeepSeek TUI by Hmbown <https://github.com/Hmbown/DeepSeek-TUI>

pkgname=deepseek-tui-cli-bin
pkgver=0.7.5
pkgrel=1
pkgdesc="A terminal coding agent for DeepSeek models with file editing, shell execution, web browsing, git operations, and MCP server integration"
arch=('x86_64')
url="https://github.com/Hmbown/DeepSeek-TUI"
license=('MIT')
depends=('openssl' 'brotli' 'zstd')
provides=('deepseek-tui')
conflicts=('deepseek-tui')
source=("https://github.com/Hmbown/DeepSeek-TUI/releases/download/v${pkgver}/deepseek-linux-x64 ")
sha256sums=('dd5cb2072e9a3a4fc7dce8b27e9be4dd37f96e285b9cb5ab8c2ac8d2dd949776')

package() {
  cd "${srcdir}"
  install -Dm755 "deepseek-linux-x64" "${pkgdir}/usr/bin/deepseek-tui"
}

# Maintainer: Hunter Bow <hmbown@gmail.com>
# Contributor: DeepSeek TUI by Hmbown <https://github.com/Hmbown/DeepSeek-TUI>

pkgname=deepseek-tui-bin
pkgver=0.8.4
pkgrel=1
pkgdesc="A terminal coding agent for DeepSeek models with file editing, shell execution, web browsing, git operations, and MCP server integration"
arch=('x86_64')
url="https://github.com/Hmbown/DeepSeek-TUI"
license=('MIT')
depends=('openssl' 'brotli' 'zstd')
provides=('deepseek-tui')
conflicts=('deepseek-tui')
source=("https://github.com/Hmbown/DeepSeek-TUI/releases/download/v${pkgver}/deepseek-tui-linux-x64")
sha256sums=('ac5acdb4f32024238a44f39fdb3f9abc681700cdef2293d13cc7ab300cf6c3d0')

package() {
  cd "${srcdir}"
  install -Dm755 "deepseek-tui-linux-x64" "${pkgdir}/usr/bin/deepseek-tui"
}

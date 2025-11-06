# Maintainer: Roc Gwei <roc dot gui at foxmail dot com>

pkgname=stylua-bin
pkgver=2.3.1
pkgrel=1
pkgdesc="A Lua code formatter."
url="https://github.com/JohnnyMorganz/StyLua"
arch=(
  x86_64
  aarch64
)
license=(MPL-2.0)
conflicts=(
  stylua
  stylua-git
)

source_x86_64=("${url}/releases/download/v${pkgver}/stylua-linux-x86_64.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/stylua-linux-aarch64.zip")

sha256sums_x86_64=('f0cfea40b3d72223497fa1650061f866e0d19a93a871aae22d3849f1bc9c2722')
sha256sums_aarch64=('21908eec45ff9666d4ae72825b81faa7fc4119124ed656eb1d470cbf9ed41bc9')

package() {
  cd "$srcdir"
  install -Dm755 stylua "$pkgdir/usr/bin/stylua"
}

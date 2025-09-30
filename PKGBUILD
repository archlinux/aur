# Maintainer: Roc Gwei <roc dot gui at foxmail dot com>

pkgname=stylua-bin
pkgver=2.3.0
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

sha256sums_x86_64=('4c06b5963b8e832b51ebafc8051bab90ee3322e51d2f5ea59f4eacae78ce8bfc')
sha256sums_aarch64=('a0874c81a2fdb5c7507b1280e02e0f5012322558328859c746348ca2304b436a')

package() {
  cd "$srcdir"
  install -Dm755 stylua "$pkgdir/usr/bin/stylua"
}

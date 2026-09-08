# Maintainer: Roc Gwei <roc dot gui at foxmail dot com>

pkgname=stylua-bin
pkgver=2.5.2
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

sha256sums_x86_64=('bcb0d855e91f102f28a370e850f8566b3b44b79e6274d806ea5246837c0fd5ab')
sha256sums_aarch64=('0ef2ebf0b7e5a652b65c4cb96c6d9ffb3981a98547de3c764465bbf54a8d761a')

package() {
  install -Dm755 stylua "$pkgdir/usr/bin/stylua"
}

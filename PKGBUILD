# Maintainer: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz>
_pkgname=emmylua-ls
pkgname="${_pkgname}-bin"
pkgver=0.18.0
pkgrel=1
pkgdesc="Lua Language Server based on EmmyLua-Analyzer-Rust"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/EmmyLuaLs/emmylua-analyzer-rust"
license=('MIT')
depends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${pkgname}-${pkgver}-x64.tar.gz::https://github.com/EmmyLuaLs/emmylua-analyzer-rust/releases/download/${pkgver}/emmylua_ls-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/EmmyLuaLs/emmylua-analyzer-rust/releases/download/${pkgver}/emmylua_ls-linux-aarch64-glibc.2.17.tar.gz")
source_riscv64=("${pkgname}-${pkgver}-riscv64.tar.gz::https://github.com/EmmyLuaLs/emmylua-analyzer-rust/releases/download/${pkgver}/emmylua_ls-linux-riscv64.tar.gz")
sha256sums_x86_64=('2617d8e6750411bde75e6f1e427e2dd2340a43257b206c8e4f93de67784967ba')
sha256sums_aarch64=('5277d56447f0f09b77338436a8a5e9ebc65fbe968896c4667abe17f63810b8aa')
sha256sums_riscv64=('5343ab50a670fc72d9fa2ec5f13c260b4453c36bc4536a65d65d4591cffffac8')

package() {
  install -Dm755 "${srcdir}/emmylua_ls" "${pkgdir}/usr/bin/emmylua_ls"
}

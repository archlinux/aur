# Maintainer: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz>
_pkgname=emmylua-ls
pkgname="${_pkgname}-bin"
pkgver=0.10.0
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
sha256sums_x86_64=('fb76a68a1442dfc27ca72aa43dbd62ca19ddf80ea41fd4378c5461790d352d2c')
sha256sums_aarch64=('05620d75ba70c0430de9b516a644d8927bba607e86262b89ab29e3fccfe55dc4')
sha256sums_riscv64=('5daabc1002faf6ded27557f88545a90a4e8643ed4aa3c29eed0e8fd3f883d61b')

package() {
  install -Dm755 "${srcdir}/emmylua_ls" "${pkgdir}/usr/bin/emmylua_ls"
}

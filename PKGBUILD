# Maintainer: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz>
_pkgname=emmylua-ls
pkgname="${_pkgname}-bin"
pkgver=0.17.0
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
sha256sums_x86_64=('40e51b4955671eba7c40c90ac36ba9584d3f4d90c6c77578f5d7253a6b0f8d3f')
sha256sums_aarch64=('3ba842c24e42c6084fa3d7901fdd191e5f531615e541b77da0c98884bb0f9483')
sha256sums_riscv64=('b34d9fbd0db7d38771cae3b4b63a3752b46e48f2e5cd0aef4ae3b9537ea306fe')

package() {
  install -Dm755 "${srcdir}/emmylua_ls" "${pkgdir}/usr/bin/emmylua_ls"
}

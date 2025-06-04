# Maintainer: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz>
_pkgname=emmylua-ls
pkgname="${_pkgname}-bin"
pkgver=0.8.0
pkgrel=1
pkgdesc="Lua Language Server based on EmmyLua-Analyzer-Rust"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/EmmyLuaLs/emmylua-analyzer-rust"
license=('MIT')
depends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("https://github.com/EmmyLuaLs/emmylua-analyzer-rust/releases/download/${pkgver}/emmylua_ls-linux-x64.tar.gz")
source_aarch64=("https://github.com/EmmyLuaLs/emmylua-analyzer-rust/releases/download/${pkgver}/emmylua_ls-linux-aarch64-glibc.2.17.tar.gz")
source_riscv64=("https://github.com/EmmyLuaLs/emmylua-analyzer-rust/releases/download/${pkgver}/emmylua_ls-linux-riscv64.tar.gz")
sha256sums_x86_64=('d15d0d37b23fa46d41abae43cce3e351c90beec404776b8c923f182aad5e160e')
sha256sums_aarch64=('9ac734e574f0dbdcf9209dc6b41c4d777403654ad15ecbb464d6123f4f6430dd')
sha256sums_riscv64=('e4e0979facd9c8f2b87d6e6fdb817d2b71726afe6b4106882451d5b74eea0a77')

package() {
  install -Dm755 "${srcdir}/emmylua_ls" "${pkgdir}/usr/bin/emmylua_ls"
}

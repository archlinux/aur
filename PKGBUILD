# Maintainer: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz>
_pkgname=emmylua-ls
pkgname="${_pkgname}-bin"
pkgver=0.23.1
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
sha256sums_x86_64=('68f957089f39d0dc1f0420270238179fdd34ec2852c9bfa897c6c0d44d3276fa')
sha256sums_aarch64=('d54614d2f23925ab57e06f09457338e26ba4dcf92c250202e1aefff0443a037e')
sha256sums_riscv64=('a913dac50eba90d8e2b4926d5b7adf0d187bb8cd49146266b6ba06d6013dda2a')

package() {
  install -Dm755 "${srcdir}/emmylua_ls" "${pkgdir}/usr/bin/emmylua_ls"
}

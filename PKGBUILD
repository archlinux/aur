# Maintainer: cc <cc20070411@163.com>
pkgname=verilog-format-git
pkgver=c169dd4
pkgrel=1
pkgdesc="Console application for apply format to verilog file."
arch=('x86_64')
url="https://github.com/ericsonj/verilog-format"
license=('unkown')
makedepends=('unzip' 'git')
changelog=
source=("${pkgname}::git+https://github.com/ericsonj/verilog-format")
sha512sums=('SKIP')
install_path="/opt/verilog-format"

package() {
  install -dm755 "${pkgdir}${install_path}"
  install -dm755 "${pkgdir}/usr/bin"
  unzip  "${srcdir}/${pkgname}/bin/verilog-format-LINUX.zip" -d "${pkgdir}${install_path}"
  cp "${pkgdir}${install_path}/verilog-format" "${pkgdir}/usr/bin/"
}

# Maintainer: taotieren <admin@taotieren.com>

pkgname=nuclei-gcc
pkgver=2020.08
pkgrel=1
pkgdesc="nuclei-gcc 是 Nuclei Studio IDE 的编译工具。"
arch=("x86_64")
makedepends=()
depends=()
optdepends=()
conflicts=()
url="https://www.nucleisys.com/download.php"
license=('unknow')
options=(!strip)

source=("https://www.nucleisys.com/upload/files/toochain/gcc/nuclei_riscv_newlibc_prebuilt_linux64_${pkgver}.tar.bz2")
sha256sums=('398C25B9385B8122D2E864BF71E47B1D871F6C326C21D0AE6D3AFD2858F36041')

package() {
	msg2 'Installing Nuclei GCC'
	install -dm755 "${pkgdir}/opt/nuclei/NucleiStudio/toolchain"

	mv "${srcdir}/gcc" "${pkgdir}/opt/nuclei"
	ln -sf "/opt/nuclei/gcc" "${pkgdir}/opt/nuclei/NucleiStudio/toolchain/gcc"
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:

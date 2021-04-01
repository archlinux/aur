# Maintainer: BienChen <binchan at gmx dot com>

pkgname=openocd-nuclei-bin
_pkgname=Nuclei-Toolchain
pkgver=0.10.0
pkgrel=15
pkgdesc='OpenOCD with RISC-V support from Nuclei System Technology (official build).'
arch=('x86_64')
url='https://nucleisys.com/download.php'
license=('GPL')
provides=('openocd')
install="${pkgname}.install"
source=("https://nucleisys.com/upload/files/toochain/openocd/nuclei-openocd-${pkgver}-${pkgrel}-linux-x64.tgz")
sha256sums=('636e48ffba7ab4b63f28f36db2549c09fb04cd2f876e450b8c3e39af4e5b983f')

package() {
  mkdir -p "${pkgdir}/opt/${_pkgname}"
  mv "${srcdir}/Nuclei/openocd/${pkgver}-${pkgrel}" "${srcdir}/openocd"
  mv "${srcdir}/openocd" "${pkgdir}/opt/${_pkgname}/"
}

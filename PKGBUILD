# Maintainer: taotieren <admin@taotieren.com>

pkgbase=at32-bootloader-doc
pkgname=at32-bootloader-doc
pkgver=2.0.7
pkgrel=5
pkgdesc="Artery AT MCU Bootloader ISP 协议文档"
arch=(any)
url="https://www.arterytek.com/cn/support/index.jsp?index=5"
license=('LicenseRef-scancode-commercial-license')
provides=(${pkgbase} ${pkgname})
conflicts=(${pkgbase} ${pkgname})
replaces=()
depends=()
makedepends=('unzip')
optdepends=(
  'artery-isp-console'
  'at-link-console'
  'at32-ide'
  'at32-ide-project-generate'
  'at32-new-clock-configuration'
  'at32-work-bench'
  'at32-openocd'
  'jlink-software-and-documentation: Segger JLink software & documentation pack for Linux'
)
backup=()
options=()
install=
_pkg_file_name=Bootloader_V${pkgver}.zip
source=("${_pkg_file_name}::https://www.arterytek.com/download/Program%20and%20Debug/Bootloader_V${pkgver}.zip")
sha256sums=('cc9e599a29606add6e44364af16ec42e2d444c13a4ca790a290a1647c0d5c67b')
noextract=(${_pkg_file_name})

package() {
    install -dm0755 "${pkgdir}/opt/artery32/${pkgbase}/"
    unzip -O gbk -o "${srcdir}"/${_pkg_file_name} -d "${pkgdir}/opt/artery32/${pkgbase}/"
}

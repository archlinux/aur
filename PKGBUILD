# Maintainer: taotieren <admin@taotieren.com>

pkgbase=at32-bootloader-doc
pkgname=at32-bootloader-doc
pkgver=2.1.0
pkgrel=1
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
sha256sums=('cc37af2e98ed46f73ed2bed615f67c1c5b8a9401cb3778d7e09b3072cc1fb95b')
noextract=(${_pkg_file_name})

package() {
    install -dm0755 "${pkgdir}/opt/artery32/${pkgbase}/"
    unzip -O gbk -o "${srcdir}"/${_pkg_file_name} -d "${pkgdir}/opt/artery32/${pkgbase}/"
}

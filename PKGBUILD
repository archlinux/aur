# Maintainer: taotieren <admin@taotieren.com>

pkgbase=at32-bootloader-doc
pkgname=at32-bootloader-doc-zh
pkgver=2.0.6
pkgrel=1
pkgdesc="Artery AT MCU Bootloader ISP 协议文档"
arch=(any)
url="https://www.arterytek.com/cn/support/index.jsp?index=5"
license=('LicenseRef-Commercial')
provides=(${pkgbase} ${pkgname})
conflicts=(${pkgbase} ${pkgname})
replaces=()
depends=()
makedepends=('unzip')
optdepends=('artery-isp-console: Artery ISP Console 是一款基于 MCU Bootloader 的命令行应用程序。使用该应用程序,用户可以通过 UART 端口或者 USB 端口配置操作 Artery 的 MCU 设备。'
    'at32-ide: AT32 IDE 是个跨平台 ARM 嵌入式系统的软件开发环境。 它包含一系列的 Eclipse 插件和工具。该插件可让用户在 AT32 IDE 开发环境下创建、建置和调试 AT32
MCU。'
    'at32-ide-project-generate: AT32 IDE 是个跨平台 ARM 嵌入式系统的软件开发环境。 它包含一系列的 Eclipse 插件和工具。该插件可让用户在 AT32 IDE 开发环境下创建、建置和调试 AT32 MCU。'
    'at-link-console: Artery AT LINK Console 是一款基于 MCU Bootloader 的命令行应用程序。支持AT32 MCU「在电路编程」Console工具'
    'at32-work-bench: AT32 MCU 图形化配置软件，生成初始化 C 代码(目前仅支持 AT32F421 系列)'
    'jlink-software-and-documentation: Segger JLink software & documentation pack for Linux')
backup=()
options=()
install=
_pkg_file_name=Bootloader_CH_V${pkgver}.zip
source=("${_pkg_file_name}::https://www.arterytek.com/download/TOOL/Bootloader_V${pkgver}_ZH.zip")
sha256sums=('3efa785d1f57b3a4e055a19e3be58b362fcc703eb9169f978a73498b2f1033ea')
noextract=(${_pkg_file_name})

package() {
    install -dm0755 "${pkgdir}/opt/artery32/${pkgbase}/"
    unzip -O gbk -o "${srcdir}"/${_pkg_file_name} -d "${pkgdir}/opt/artery32/${pkgbase}/"
}

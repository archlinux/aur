# Maintainer: Clansty <i@gao4.pw>

pkgname=altserver-bin
_pkgver=0.0.3-rc1
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc='AltServer for Linux'
license=('AGPL3')
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/NyaMisty/AltServer-Linux"
provides=('altserver')
source=(altserver.service)
source_x86_64=("AltServer-${_pkgver}-x86_64::https://github.com/NyaMisty/AltServer-Linux/releases/download/v${_pkgver}/AltServer-x86_64") 
source_i686=("AltServer-${_pkgver}-i686::https://github.com/NyaMisty/AltServer-Linux/releases/download/v${_pkgver}/AltServer-i586") 
source_aarch64=("AltServer-${_pkgver}-aarch64::https://github.com/NyaMisty/AltServer-Linux/releases/download/v${_pkgver}/AltServer-aarch64") 
source_armv7h=("AltServer-${_pkgver}-armv7h::https://github.com/NyaMisty/AltServer-Linux/releases/download/v${_pkgver}/AltServer-armv7") 

package() {
    install -Dm755 "AltServer-${_pkgver}-$CARCH" "${pkgdir}/usr/bin/altserver"
    install -Dm644 "altserver.service" "${pkgdir}/usr/lib/systemd/system/altserver.service"
}
sha256sums=('3d5b1c66a9959aa42eea5db7222768236b8a52f6a9caa3bbad7a5404506ffa4e')
sha256sums_x86_64=('eb4be591663e1b61108feee7f58f305b593854cdc9205ad474251cd273670f5c')
sha256sums_i686=('8584d408384e049e1b6fec27cc5d1159572f2300be3c074b902143bbe8e98898')
sha256sums_aarch64=('e765516f3c37d7c48e816b10a8a6872cc6db817b41fbd36ca8f7a37db0cdca5e')
sha256sums_armv7h=('5dce8a7bcffbb037283a4cb0cbab7f8e738860ddee016a6339e0566291a87f03')

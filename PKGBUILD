# Maintainer: Clansty <i@gao4.pw>

pkgname=altserver-bin
_pkgver=0.0.5
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
sha256sums_x86_64=('0be7c3adc69ec1177a15032b3b8e37c5d0e4fefb47c9c439cd62c238b3ea17fb')
sha256sums_i686=('c71b9cc5e7e614e8999fa7e0027299eb2cf1706fa64a95ef2f3c65962e3ddc42')
sha256sums_aarch64=('886020aa44b50d382252051967d6ec4ac35f5a08234887a6f8c96e73a5f3de29')
sha256sums_armv7h=('f7da2526538c10c6d9b4520ba5246e999523d78e887320f71eb3390229993db8')

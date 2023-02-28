# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aechoterm-bin
_pkgname=aechoterm
pkgver=4.0.0
pkgrel=1
pkgdesc="A free, cross-platform terminal and file management tool for accessing remote servers with SSH and SFTP protocols.闪令是一款免费的、跨平台的,以SSH、SFTP协议访问远程服务器的终端、文件管理工具"
arch=('x86_64')
url="https://ec.nantian.com.cn/"
license=('unknown')
options=(!strip)
conflicts=(aechoterm-appimage)
depends=(nodejs-lts-fermium nss lib32-gcc-libs alsa-lib at-spi2-core python gtk3 java-runtime)
source=("${_pkgname}-${pkgver}.deb::https://ec.cnd.nantiangzzx.com/Aechoterm_${pkgver}_amd64.deb")
sha512sums=('e5872ff1bee36fec2daec14fb935c35fbc15f44f7c77ae11e1fbacedfc89057fe13bdc279d3976571a4ee41ef9b7fb882ddbd141f6bea67f05d8fab8775f6db9')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
}

# Maintainer: insmtr <insmtr@insmtr.cn>
pkgname=pumpkin-bin
pkgver=0.2.0+26.3_26.51
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="Empowering everyone to host fast and efficient Minecraft servers"
arch=('x86_64' 'aarch64')
url="https://pumpkinmc.org"
_url="https://github.com/Pumpkin-MC/Pumpkin/releases/download"
license=('GPL-3.0')
provides=('pumpkin')
conflicts=('pumpkin')
source_x86_64=(pumpkin-X64-Linux::$_url/${_pkgver}/pumpkin-X64-Linux)
source_aarch64=(pumpkin-ARM64-Linux::$_url/${_pkgver}/pumpkin-ARM64-Linux)
options=(!debug)
sha256sums_x86_64=('68c4416ca9fbfb3f2aeb6a8ce1de0e3fb02c5a85a53c8ba59a27941d7e43d8cd')
sha256sums_aarch64=('5cc0300f42e37d40f500b7b21d5194351939729c11b3bb0c28b4b77419dc00c9')

package() {
    install -Dm755 $srcdir/pumpkin-* $pkgdir/usr/bin/pumpkin
}

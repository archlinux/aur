# Maintainer: insmtr <insmtr@insmtr.cn>
pkgname=pumpkin-bin
pkgver=0.1.0.dev.r$(date +%Y%m%d)
pkgrel=1
pkgdesc="Empowering everyone to host fast and efficient Minecraft servers"
arch=('x86_64' 'aarch64')
url="https://pumpkinmc.org"
_url="https://github.com/Pumpkin-MC/Pumpkin/releases/download/nightly"
license=('GPL-3.0')
provides=('pumpkin')
conflicts=('pumpkin')
source_x86_64=(pumpkin-X64-Linux::$_url/pumpkin-X64-Linux)
source_aarch64=(pumpkin-ARM64-Linux::$_url/pumpkin-ARM64-Linux)
options=(!debug)
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm755 $srcdir/pumpkin-* $pkgdir/usr/bin/pumpkin
}

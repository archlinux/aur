# Maintainer: Empyrealm <realminc.depravity737@passinbox.com>
pkgname=oa-sdk-bin
pkgver=0.7.5
pkgrel=1
pkgdesc="OA SDK — Development headers, CMake configs, and shader sources (pre-built binaries)"
arch=('x86_64')
url="https://github.com/realminc/oa"
license=('BUSL-1.1')
depends=("oa-bin=${pkgver}")
source=("https://github.com/realminc/oa/releases/download/v${pkgver}/oa-sdk-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('d2ea329340d63913385fad2d78a0b64f83b556457fea0ea9d20a8e1f83725a3c')

package() {
  tar -xzf "$srcdir/oa-sdk-${pkgver}-linux-x86_64.tar.gz" -C "$pkgdir"
}

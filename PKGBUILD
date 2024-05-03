# Maintainer: Jorge Pizarro-Callejas, a.k.a Jorgicio <jpizarrocallejas@gmail.com>

pkgname=zinkrun
pkgver=1.1
pkgrel=1
pkgdesc="Wrapper for Zink, to use it to run OpenGL games in the top of Vulkan"
arch=('any')
url="https://aur.archlinux.org/packages/zinkrun"
license=('GPL')
depends=('bash' 'mesa' 'opengl-driver' 'vulkan-icd-loader')
source=("zinkrun")
install=zinkrun.install
sha256sums=('a8a47ed06e68e5071cd3009d3ee7e2b01e04680659d3bbd01f14dbf57589ae7c')

package() {
    install -Dm755 $srcdir/zinkrun $pkgdir/usr/bin/zinkrun
}

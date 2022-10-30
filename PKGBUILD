# Maintainer: Jorge Pizarro-Callejas, a.k.a Jorgicio <jpizarrocallejas@gmail.com>

pkgname=zinkrun
pkgver=1.0
pkgrel=1
pkgdesc="Wrapper for Zink, to use it to run OpenGL games in the top of Vulkan"
arch=('any')
url="https://aur.archlinux.org/packages/zinkrun"
license=('GPL')
depends=('bash' 'mesa' 'opengl-driver' 'vulkan-icd-loader')
source=("zinkrun")
install=zinkrun.install
sha256sums=('4a50138cbdf4f2b0ae08726e0b4fb40571078ce202e194d26ba10cdebb62b307')

package() {
    install -Dm755 $srcdir/zinkrun $pkgdir/usr/bin/zinkrun
}

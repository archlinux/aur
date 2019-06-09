# Maintainer: Robert Csordas <xdever@gmail.com>
pkgname=nvidia-gpu-switch
_gitsha="aa6ea2c52e1c83fcb633cd3f26a8bde47b5ced07"
pkgver=1.0
pkgrel=1
epoch=
arch=("any")
url="https://github.com/xdever/linux_gpu_switch"
groups=()
depends=("nvidia" "bbswitch")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=("git+https://github.com/xdever/linux_gpu_switch#commit=${_gitsha}")
license=('Apache')
md5sums=('SKIP')
pkgdesc="Tool to switch on/off Nvidia laptop GPU for compute, without optirun."

package () {
    install -D -m755 ${srcdir}/linux_gpu_switch/gpu ${pkgdir}/usr/bin/gpu
}

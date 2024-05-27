# Maintainer: YuLong Yao <feilongphone@gmail.com>
pkgname=devpod-bin
pkgver=0.5.11
pkgrel=1
pkgdesc="Codespaces but open-source, client-only, and unopinionated - unofficial package"
arch=('x86_64')
url="https://github.com/loft-sh/devpod"
license=('MPL-2.0')
depends=('fuse2')
conflicts=('devpod')
options=('!strip')
source=(
    "https://github.com/loft-sh/devpod/releases/download/v${pkgver}/DevPod_linux_x86_64.tar.gz"
)
sha256sums=('9348f096a63dbad058cc0b49bbfb7004815f1f987d3abcba7274757ac5678b1a')

package() {
    tar -xzf "${srcdir}/DevPod_linux_x86_64.tar.gz" -C "${pkgdir}/"
}

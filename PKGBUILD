# Maintainer: YuLong Yao <feilongphone@gmail.com>
pkgname=devpod-bin
pkgver=0.5.4
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
sha256sums=('44688eab9ddd8ac4d57abcb90525b5799433dba5babf3790b1923862a1fceca3')

package() {
    tar -xzf "${srcdir}/DevPod_linux_x86_64.tar.gz" -C "${pkgdir}/"
}

# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=bcvk-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="bcvk - bootc virtualization kit"
arch=("x86_64")
url="https://github.com/bootc-dev/bcvk"
license=('Apache-2.0')
depends=(
    'glibc'
    'gcc-libs'
    'qemu-system-x86'
    'libvirt'
    'podman'
    'virtiofsd'
    'openssh'
)
source=("${url}/releases/download/v${pkgver}/bcvk-x86_64-unknown-linux-gnu.tar.gz")
b2sums=('1434a6c433a611d4467a75b0392275d25e31f8694b137654e40f21ccee333e040b7ed74631ba39509f68a7e08fc721dcde84abfc1c7e34cb1dce95b09afdef07')

package() {
    install -vDm755 bcvk-x86_64-unknown-linux-gnu "${pkgdir}/usr/bin/bcvk"
}

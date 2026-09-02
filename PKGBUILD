# Maintainer: piratecarrot

pkgname=can-utils-bin
pkgver=2025.01
_pkgrel_src=3
pkgrel=1
pkgdesc="Linux-CAN / SocketCAN user space applications (precompiled)"
arch=('x86_64')
url="https://github.com/linux-can/can-utils"
license=('GPL-2.0-only')
options=('!debug')
provides=('can-utils')
conflicts=('can-utils' 'can-utils-git')

source=("https://github.com/tubbywrestler/can-utils-bin/releases/download/${pkgver}-${_pkgrel_src}/can-utils-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst")
sha256sums=('c04e77240c53ab0ae82eb06f4238f87340180d225754faf5c2c680a1eb099f58')

package() {
    bsdtar -xf "${srcdir}/can-utils-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst" -C "${pkgdir}" --exclude .PKGINFO --exclude .BUILDINFO --exclude .MTREE
}

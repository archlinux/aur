 
# Maintainer: Quentin Bouvet <qbouvet at outlook dot com>
pkgname=dolphin-squashfs-mount
pkgver=1.0
pkgrel=1
pkgdesc="Mount squashfs archives in dolphin right-click menu"
arch=('any')
url="https://github.com/shvchk/dolphin-squashfs-mount"
license=('GPLv3')
depends=('dolphin' 'squashfuse')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shvchk/dolphin-squashfs-mount/archive/v1.0.tar.gz")
sha256sums=('d0699590502350a70c0cb2d88cf4e872e85117f6b5c37cc05b14a0e48ebee1e7')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m0755 -t "${pkgdir}/usr/share/kservices5/ServiceMenus/" \
    "squashfs-mount.desktop"
}

#
# makepkg --printsrcinfo > .SRCINFO
#

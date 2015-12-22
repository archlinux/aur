# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# re-write of original package by gradgrind(Michael Towers)

pkgname=larch-live
pkgver=8.2.4
pkgrel=10
pkgdesc="larch: (partly compulsory) components for the live system"
#Originally larch was at http://larch.berlios.de
url="https://gitlab.com/ninjaos/larch"
arch=('any')
license=('GPL')
depends=('aufs-util' 'squashfs-tools' 'syslinux')
options=(strip docs libtool emptydirs zipman purge)
source=("larch-live.tar.gz")
sha256sums=('8cf9b0f82661a5e8b7ca927eb9fe4f0ded55ec1b742000f1119edf3ae3a4b411')

package() {
  cd "${srcdir}"
  cp -ra . "${pkgdir}"
}



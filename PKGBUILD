# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=encryptr-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Zero knowledge cloud-based password manager"
url="https://encryptr.org"
arch=('x86_64' 'i686')
license=('GPL')

source_i686=("https://github.com/devgeeks/Encryptr/releases/download/v1.2.0/encryptr_1.2.0_i386.tar.gz")
ms5sums_i686=('96f481e95afc8ff6b8047744e8f969e7')

source_x86_64=("https://github.com/devgeeks/Encryptr/releases/download/v1.2.0/encryptr_1.2.0_amd64.tar.gz")
md5sums_x86_64=('60e34294656a85a5193c9bc42afb0156')

package() {
  install -dm755 "${pkgdir}/opt"
  cp --preserve=mode -r "${srcdir}/Encryptr" "${pkgdir}/opt/${pkgname}"
}

# vim:set ts=2 sw=2 et:

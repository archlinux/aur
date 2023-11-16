# Maintainer: Naglis Jonaitis <naglis at mailbox dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=libduck1
pkgver=1.1.2
pkgrel=1
pkgdesc="A Daisy 2.02 parser API, libduck is a C library for parsing DTB (Digital Talking Book). Currently, only the Daisy 2.02 format is supported"
arch=('x86_64')
url='https://github.com/Skywalker13/libduck'
license=('GPL3' 'LGPL2.1')
depends=('libxml2')
source=("${pkgname}-${pkgver}.deb::https://github.com/Skywalker13/DaisyDuck/releases/download/v1.0.3/libduck1_${pkgver}-1_amd64.deb")
sha256sums=('c9f3ee8d60655551571fb9c903e31bcb680c7b8c49d673b3c77d36fc7a2e6270')

package() {
  bsdtar -xvf data.tar.xz -C "${pkgdir}/"
  rm "${pkgdir}/usr/share/doc/libduck1/changelog.Debian.gz"
  rm "${pkgdir}/usr/share/doc/libduck1/copyright"
}

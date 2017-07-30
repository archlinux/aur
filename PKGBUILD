# Maintainer: Gabriel Moura <g@srmoura.com.br>

pkgname=cec-utils
pkgver=4.0.1
pkgrel=0
pkgdesc="This package provides the CEC utility programs."
arch=('x86_64')
url="http://libcec.pulse-eight.com"
license=('GPL')
makedepends=('ncurses' 'libtinfo' 'p8-platform')
_deb=${pkgname}_${pkgver}+dfsg1-1_amd64.deb
source=("http://ftp.br.debian.org/debian/pool/main/libc/libcec/${_deb}")
sha512sums=('3caa8ee9137c7458068c331a55709ac06bcf201f4e519ac91aad055244e736c22dc1480b5fc39a9caa843326bbbb233a2edbcd9a141445b5aa21dc2ac0fe4746')

package() {
tar -xvf "${srcdir}/data.tar.xz" --directory ${pkgdir}
cd ${pkgdir}
  install -dm755 "${pkgdir}/usr/bin"
  install -dm644 "${pkgdir}/usr/share"
}

# vim:set ts=2 sw=2 et:

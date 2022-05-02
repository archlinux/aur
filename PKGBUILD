# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=libowfat-bin
pkgver=0.30
pkgrel=2
_debver=3
_pkg=libowfat
pkgdesc='Reimplementation of libdjb, shared library (binary version)'
arch=('x86_64' 'i686')
url='https://www.fefe.de/libowfat/'
license=('GPL')
options=(!strip)
_url=http://ftp.debian.org/debian/pool/main/libo/${_pkg}
source_x86_64=(${_url}/${_pkg}0_${pkgver}-${_debver}_amd64.deb)
source_i686=(${_url}/${_pkg}0_${pkgver}-${_debver}_i386.deb)
sha1sums_x86_64=('42ebca16dcd88d6140d86a94d55d3c94ce0c88cf')
sha1sums_i686=('cd6e20ca41280ae5a5a75475f5801fee9a9ad7ae')

prepare() {
    bsdtar xf data.tar.xz
}

package() {
  cp -r "usr" "${pkgdir}"
  mv "${pkgdir}/usr/share/doc/${_pkg}0/" "${pkgdir}/usr/share/doc/${_pkg}"
}

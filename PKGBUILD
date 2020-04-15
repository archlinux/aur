# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=libowfat-bin
pkgver=0.30
pkgrel=1
_debver=2+b1
_pkg=libowfat
pkgdesc='Reimplementation of libdjb, shared library (binary version)'
arch=('x86_64' 'i686')
url='https://www.fefe.de/libowfat/'
license=('GPL')
options=(!strip)
_url=http://ftp.debian.org/debian/pool/main/libo/${_pkg}
source_x86_64=(${_url}/${_pkg}0_${pkgver}-${_debver}_amd64.deb)
source_i686=(${_url}/${_pkg}0_${pkgver}-${_debver}_i386.deb)
sha1sums_x86_64=('fcbf4cb85779a4e38c6937e7d86e735629ef6ac2')
sha1sums_i686=('e7cd16154f8ae62887d523823f5c60340e0064ac')

prepare() {
    bsdtar xf data.tar.xz
}

package() {
  cp -r "usr" "${pkgdir}"
  mv "${pkgdir}/usr/share/doc/${_pkg}0/" "${pkgdir}/usr/share/doc/${_pkg}"
}

# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=gatling-bin
pkgver=0.13
pkgrel=2
_debver=6.1+b1
_pkg=gatling
pkgdesc='A high performance http, ftp and smb server (binary version)'
arch=('x86_64' 'i686')
url='http://www.fefe.de/gatling/'
license=('GPL')
options=(!strip)
depends=('libowfat-bin' 'libxcrypt-compat')
_url=http://ftp.debian.org/debian/pool/main/g/${_pkg}
source_x86_64=(${_url}/${_pkg}_${pkgver}-${_debver}_amd64.deb)
source_i686=(${_url}/${_pkg}_${pkgver}-${_debver}_i386.deb)
sha1sums_x86_64=('1da23fc6308b45a4daeb0b71ac8bfa72e49fcf60')
sha1sums_i686=('d1f1cad39901c5bb278a13c03eb5861de319b9bc')

prepare() {
    bsdtar xf data.tar.xz
}

package() {
  cp -r usr "${pkgdir}"
}

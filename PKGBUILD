# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=gatling-bin
pkgver=0.13
pkgrel=1
_debver=6+b3
_pkg=gatling
pkgdesc='A high performance http, ftp and smb server (binary version)'
arch=('x86_64' 'i686')
url='http://www.fefe.de/gatling/'
license=('GPL')
options=(!strip)
depends=(libowfat-bin)
_url=http://ftp.debian.org/debian/pool/main/g/${_pkg}
source_x86_64=(${_url}/${_pkg}_${pkgver}-${_debver}_amd64.deb)
source_i686=(${_url}/${_pkg}_${pkgver}-${_debver}_i386.deb)
sha1sums_x86_64=('9251fbf573a7de622296456338dbf787771000a0')
sha1sums_i686=('ce541442356cb8d9774190e8c06dee7b062ef99a')

prepare() {
    bsdtar xf data.tar.xz
}

package() {
  cp -r usr "${pkgdir}"
}

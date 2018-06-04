# Contributor: saxonbeta <saxonbeta at gmail>
# Contributor: goten002 <goten002@gmail.com>
# Contributor: epinull

pkgname=mynotex
pkgver=1.4.1.0
pkgrel=1
pkgdesc="free note-taking and notes manager software for Linux"
url="http://sites.google.com/site/mynotex"
license=('GPL')
arch=('i686' 'x86_64')
depends=('sqlite3' 'gtk2')
source_i686=("https://sites.google.com/site/${pkgname}/files/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("https://sites.google.com/site/${pkgname}/files/${pkgname}_${pkgver}_amd64.deb")
md5sums_i686=('5ccdee9c57ef13a9e4902b97e86bc833')
md5sums_x86_64=('657979d34ffe42af2da902894825e2cf')


package() {
  tar -axf data.tar.xz -C "$pkgdir"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/mynotex/mynotex" "${pkgdir}/usr/bin/mynotex"
}


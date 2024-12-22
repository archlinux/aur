# $Id$
# Maintainer: https://aur.archlinux.org/account/999cgm

pkgname=check-pacman-mtree
pkgver=0.9
pkgrel=1
pkgdesc='pacman db mtree check size/md5/sha256/symlink'
license=('GPL2')
arch=('any')
url="http://luajit.org/luajit.html"
depends=( 'luajit' 'openssl' 'zlib' )
source=("${pkgname}-${pkgver}.lua")
sha512sums=('8763e64fa77cf7f76dabaefa0ee85b55bfb676259c666cb443a9ea748616ca7f5aece8b9aacaecc2134cf999bab2cbedaf5b14d1a3657c1489aa4313f4fa345d')

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}.lua" "${pkgdir}/usr/bin/${pkgname}.lua"
}


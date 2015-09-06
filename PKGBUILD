# $Id$
# Maintainer: https://aur.archlinux.org/account/999cgm

pkgname=check-pacman-mtree
pkgver=0.7
pkgrel=1
pkgdesc='pacman db mtree check size/md5/sha256/symlink'
license=('GPL2')
arch=('any')
url="http://luajit.org/luajit.html"
depends=( 'luajit' 'openssl' 'zlib' )
source=("${pkgname}-${pkgver}.lua")
sha1sums=('0610fed2efe80a86bb558f9e8a416541f146d604')

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}.lua" "${pkgdir}/usr/bin/${pkgname}.lua"
}


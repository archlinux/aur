# $Id$
# Maintainer: https://aur.archlinux.org/account/999cgm

pkgname=check-pacman-mtree
pkgver=0.8
pkgrel=1
pkgdesc='pacman db mtree check size/md5/sha256/symlink'
license=('GPL2')
arch=('any')
url="http://luajit.org/luajit.html"
depends=( 'luajit' 'openssl' 'zlib' )
source=("${pkgname}-${pkgver}.lua")
sha512sums=('bb385bec9c3f3d122446a256a893161722eba550877c9720f48f32862f55105f3374f2e57c30b2c3359cf00e33a348605ac646bf5a140d39631e6b93b1eab00b')

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}.lua" "${pkgdir}/usr/bin/${pkgname}.lua"
}


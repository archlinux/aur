# $Id$
# Maintainer: https://aur.archlinux.org/account/999cgm

pkgname=check-pacman-mtree
pkgver=0.8
pkgrel=3
pkgdesc='pacman db mtree check size/md5/sha256/symlink'
license=('GPL2')
arch=('any')
url="http://luajit.org/luajit.html"
depends=( 'luajit' 'openssl' 'zlib' )
source=("${pkgname}-${pkgver}.lua")
sha512sums=('f3c1691743833c54acb8cae2dcfafba4b2e5b2616fc0221ad33b1b942a8cf03ea2feceead85479675bd525db11dc97c273a29e6a3574a17ad38328c958a30421')

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}.lua" "${pkgdir}/usr/bin/${pkgname}.lua"
}


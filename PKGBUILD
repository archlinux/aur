# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor: John-Gee

pkgname=goofys-bin
pkgver=0.24.0
pkgrel=1
pkgdesc="Goofys is a high performance Amazon S3 backend filey-system interface"
arch=('x86_64')
url="https://github.com/kahing/goofys"
license=('Apache')
conflicts=('goofys' 'goofys-git')
depends=('fuse')

source=("goofys-${pkgver}::https://github.com/kahing/goofys/releases/download/v${pkgver}/goofys")
md5sums=('250e86abdccd093df49ffb3be94968b0')

package() {
  cd $srcdir
  install -Dm755 "goofys-${pkgver}" "$pkgdir/usr/bin/goofys"
}

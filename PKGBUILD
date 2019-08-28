# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor: John-Gee

pkgname=goofys-bin
pkgver=0.21.0
pkgrel=1
pkgdesc="Goofys is a high performance Amazon S3 backend filey-system interface"
arch=('x86_64')
url="https://github.com/kahing/goofys"
license=('Apache')
conflicts=('goofys' 'goofys-git')
depends=('fuse')

source=("https://github.com/kahing/goofys/releases/download/v${pkgver}/goofys")
md5sums=('fcf44727058c5a1e504648886cca1949')

package() {
  cd $srcdir
  install -Dm755 goofys "$pkgdir/usr/bin/goofys"
}

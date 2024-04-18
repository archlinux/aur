# Maintainer: Sterophonick
pkgname=atapi-mimetypes
_pkgname='atapi-mimetypes'
pkgver=1
pkgrel=3
pkgdesc='Various MIME types for my own personal use :3'
arch=(any)
makedepends=()
source=(x-atapi-mimetypes.xml)
md5sums=('SKIP')

package() {
  cd $srcdir
  install -Dm644 "$srcdir/x-atapi-mimetypes.xml" "$pkgdir/usr/share/mime/packages/x-atapi-mimetypes.xml"
}

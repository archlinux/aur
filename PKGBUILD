# Maintainer: zoe <chp321 AT gmail DOT com>

pkgname=stitch-scanned-images
pkgver=0.1
pkgrel=1
pkgdesc="automatically stitches a set of high resolution scanned segments of a large document, e.g. map, producing a near-seamless output"
arch=(any)
url="https://github.com/mpetroff/stitch-scanned-images"
license=("MIT License")
depends=('python>=3.2' 'hugin' 'imagemagick' )
source=("${pkgname}.git::git+https://github.com/mpetroff/${pkgname}.git")
md5sums=(SKIP)

package() {
  mkdir -p ${pkgdir}/usr/share/doc/
  install -D -m 0755 ${srcdir}/${pkgname}.git/${pkgname}.py \
		     $pkgdir/usr/bin/${pkgname}
  install -D -m 0644 ${srcdir}/${pkgname}.git/readme.md \
		     $pkgdir/usr/share/doc/${pkgname}.md
}

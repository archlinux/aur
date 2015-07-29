# Maintainer: Beej Jorgensen <beej@beej.us>
pkgname=xtide-wvs
pkgver=20130529
pkgrel=2
pkgdesc="World vector shoreline data for XTide"
arch=('any')
url="http://www.flaterco.com/xtide/files.html#WVS"
license=('custom')
source=(
  'ftp://ftp.flaterco.com/xtide/wvs.tar.bz2'
  'license.txt'
)
md5sums=('56325c8105c7137ced73396f2f2d8221'
         '8bb852301ffc904570d90c0d3c564635')

package() {
  # license
  install -D -m0644 $srcdir/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt

  # data files
  install -d $pkgdir/usr/share/xtide/
  install -m0644 $srcdir/wvs*.dat $pkgdir/usr/share/xtide
}

# vim:set ts=2 sw=2 et:


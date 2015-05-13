# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: rabyte <rabyte__gmail>

pkgname=curlmirror
pkgver=20150310
pkgrel=1
pkgdesc="Mirrors a web site by using curl to download each page"
arch=('any')
url="https://github.com/cudeso/tools/blob/master/curlmirror.txt"
# linked from http://curl.haxx.se/docs/programs.html
license=('GPL2')
depends=('curl' 'perl')
source=(https://github.com/cudeso/tools/raw/master/${pkgname}.txt)
md5sums=('14c8928d727e08d023a6325e0ec5af3f')


package() {
  install -m755 -D $pkgname.txt $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:

# $Id: PKGBUILD 276906 2017-12-29 21:36:25Z jelle $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tim Lee <tl1234562004@yahoo.com>

pkgname=tablelist
pkgver=6.19
pkgrel=1
pkgdesc="A library for Tcl/Tk 8.0 or higher"
arch=('any')
url="http://www.nemethi.de"
license=("custom")
depends=('bash' 'tcl')
source=(https://www.nemethi.de/tablelist/$pkgname$pkgver.tar.gz \
        https://www.nemethi.de/tablelist/COPYRIGHT.txt )
sha256sums=('67bfd43aef2ab13d58694ee49225478b1b2089cd910116e95ec9ce1e5cfa641b'
            '075ea86d25b8949db984653728d2c7d9aeee392700ded30411be18c6f95dbdc4')

package() {
  mkdir -p "$pkgdir"/usr/lib/tcl8.6
  cp -a "$srcdir"/$pkgname$pkgver "$pkgdir"/usr/lib/tcl8.6/
  install -D COPYRIGHT.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

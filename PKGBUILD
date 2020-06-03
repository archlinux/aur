# $Id: PKGBUILD 276906 2017-12-29 21:36:25Z jelle $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tim Lee <tl1234562004@yahoo.com>

pkgname=tablelist
pkgver=6.9
pkgrel=1
pkgdesc="A library for Tcl/Tk 8.0 or higher"
arch=('any')
url="http://www.nemethi.de"
license=("custom")
depends=('bash' 'tcl')
source=(http://www.nemethi.de/tablelist/$pkgname$pkgver.tar.gz \
        http://www.nemethi.de/tablelist/COPYRIGHT.txt )
sha256sums=('996ba64c472e200a2802b2a105a8bb9261dfbc4098c2ac0e63383680dc9aee57'
            '3cc9d56e829be4a6bd57ed0d81737e8ba8a5939de30b8139e413ddd8aaa972c6')

package() {
  mkdir -p "$pkgdir"/usr/lib/tcl8.6
  cp -a "$srcdir"/$pkgname$pkgver "$pkgdir"/usr/lib/tcl8.6/
  install -D COPYRIGHT.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

# Maintainer: Siôn Le Roux <sinisterstuf@gmail.com>

pkgname=tomboy-pastebinit
pkgver=0.1
pkgrel=1
pkgdesc="A tomboy plugin to send notes to a Pastebin service"
url="https://launchpad.net/tomboy-pastebinit/"
depends=('tomboy')
arch=(any)
license=(LGPL)
source=("https://launchpad.net/tomboy-pastebinit/trunk/0.1/+download/PasteBinIt.dll")
md5sums=('e683cea2d3691007d55ca4866db88165')

package() {
    install -Dm644 $srcdir/PasteBinIt.dll $pkgdir/usr/lib/tomboy/addins/PasteBinIt.dll
}
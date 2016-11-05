#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
#Maintainer: David McInnis <davidm@eagles.ewu.edu>
#Contributer: André Silva <emulatorman@parabola.nu>
#Contributer: Márcio Silva <coadde@parabola.nu>

pkgname=jquery-ui
pkgver=1.12.1
pkgrel=1
pkgdesc='A curated set of user interface interactions, effects, widgets, and themes built on top of the jQuery JavaScript Library.'
arch=('any')
url='https://jqueryui.com/'
license=('MIT')
depends=('jquery')
source=("https://jqueryui.com/resources/download/$pkgname-$pkgver.zip")
md5sums=('e0cfea21c9d1acd37fb58592f2c1f50d')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/usr/share/javascript/$pkgname
  install -d $pkgdir/usr/share/licenses/$pkgname
  cp -a ./${pkgname}*.{js,css} $pkgdir/usr/share/javascript/$pkgname/
  cp -a LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

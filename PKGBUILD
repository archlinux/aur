#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=bootswatch
pkgver=3.3.7
pkgrel=1
pkgdesc='A collection of open source themes for Bootstrap.'
arch=('any')
url='https://bootswatch.com/'
license=('MIT')
depends=('bootstrap')
provides=("${pkgname}" "bootswatch")
conflicts=("${pkgname}" "bootswatch")
source=("https://github.com/thomaspark/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c967d1e64ff1cc5b43bfc23546ec04951e07d50368224c2af5a00b73254868f3')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/usr/share/javascript/$pkgname
  cp -a ./{cerulean,cosmo,cyborg} $pkgdir/usr/share/javascript/$pkgname/
  cp -a ./{darkly,flatly,journal} $pkgdir/usr/share/javascript/$pkgname/
  cp -a ./{lumen,paper,readable} $pkgdir/usr/share/javascript/$pkgname/
  cp -a ./{sandstone,simplex,slate} $pkgdir/usr/share/javascript/$pkgname/
  cp -a ./{spacelab,superhero,united} $pkgdir/usr/share/javascript/$pkgname/
  cp -a ./yeti $pkgdir/usr/share/javascript/$pkgname/
}

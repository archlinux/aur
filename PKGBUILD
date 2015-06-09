# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=screenswitch
pkgver=1.0
pkgrel=1
pkgdesc="Quickly toggle between different connected displays."
arch=(any)
url="https://github.com/hobarrera/screenswitch"
license=('BSD')
depends=("python2-xrandr")
source=("https://github.com/hobarrera/$pkgname/archive/v$pkgver.zip")
md5sums=('166077ddebe62b0bd34af3b8fb010214')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 screenswitch.py "$pkgdir/usr/bin/screenswitch"
}

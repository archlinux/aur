# Maintainer: Cerebrux <mail@cerebrux.net>
pkgname=justdo
pkgver=1.0.2
pkgrel=1
pkgdesc="Simple pomodoro timer for your terminal... no deep sheeeaaat"
arch=('any')
url="https://github.com/CerebruxCode/justdo"
license=('GPL3')
depends=('libnotify' 'libpulse' )
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CerebruxCode/justdo/archive/v${pkgver}.tar.gz")

package() {
  cd "$pkgname-$pkgver"
  cp -r .justdo "/home/$USER/.justdo"
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 justdo.sh "$pkgdir/usr/bin/justdo"
}

md5sums=('71e2407679493afcd12959631397b73e')

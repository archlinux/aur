# Maintainer: Zesko
pkgname=systemd-timer-notify
pkgver=1.0.1
pkgrel=1
pkgdesc="Displays a desktop notification when a systemd service starts and automatically closes it when the service finishes."
arch=('any')
url="https://gitlab.com/Zesko/systemd-timer-notify"
license=('GPL3')
depends=('python' 'dunst' 'systemd' 'openssh')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
backup=("etc/${pkgname}.conf")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a493bc1c61328e39e2f622a8524c59f68451ce6cce9d514fd78385f469cb4830')


package() {
  cd "$srcdir/$pkgname-$pkgver"
  cp -vr usr etc "$pkgdir"
}

# Maintainer: Zesko
pkgname=systemd-timer-notify
pkgver=1.0.0
pkgrel=2
pkgdesc="It notifies you on Desktop when systemd-service is started and processed, the notification will be closed automatically when systemd-service's process is done."
arch=('any')
url="https://gitlab.com/Zesko/systemd-timer-notify"
license=('GPL3')
depends=('python' 'dunst' 'systemd' 'openssh')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
backup=("etc/${pkgname}.conf")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/Release-$pkgver/$pkgname-Release-$pkgver.tar.gz")
sha256sums=('SKIP')


package() {
  cd "$srcdir/$pkgname-Release-$pkgver"
  cp -vr usr etc "$pkgdir"
}

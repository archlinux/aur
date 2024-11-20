# Maintainer: Zesko
pkgname=journalctl-desktop-notification
pkgver=1.1.0
pkgrel=1
pkgdesc="Notifies you on the desktop when any error message appears in the Journalctl log."
arch=('any')
url="https://gitlab.com/Zesko/journalctl-desktop-notification"
license=('GPL3')
depends=('dunst' 'systemd')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
backup=("etc/${pkgname}.conf")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f49fef893d9436869eb9a819a17e7c967dcb39ba624e86e8cd35a2c03b12249f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cp -vr usr etc "$pkgdir"
}

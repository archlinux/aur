# Maintainer: Zesko
pkgname=journalctl-desktop-notification
pkgver=1.2.0
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
sha256sums=('8f86ae594fd8be3004e9e0a1feff128ece736900cc37a15442b0681453c5eef1')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cp -vr usr etc "$pkgdir"
}

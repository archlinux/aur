# Maintainer: Zesko
pkgname=journalctl-desktop-notification
pkgver=1.0.1
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
sha256sums=('df3d0bf41503cff921af2f83b3f2e7cf3c6ff096f11cedb8d0d29b8c6df9ca79')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cp -vr usr etc "$pkgdir"
}

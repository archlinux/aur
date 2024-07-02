# Maintainer: Zesko
pkgname=journalctl-desktop-notification
pkgver=1.0.0
pkgrel=2
pkgdesc="It notifies you on the desktop when an error message appears in Journalctl log."
arch=('any')
url="https://gitlab.com/Zesko/journalctl-desktop-notification"
license=('GPL3')
depends=('dunst' 'systemd')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
backup=("etc/${pkgname}.conf")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/Release-$pkgver/$pkgname-Release-$pkgver.tar.gz")
sha256sums=('1d57cf4e0f367339d5148c7e4ca7270098c29962b1a4fab5e0aa9c5abd388d4d')

package() {
  cd "$srcdir/$pkgname-Release-$pkgver"
  cp -vr usr etc "$pkgdir"
}

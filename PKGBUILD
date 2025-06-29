# Maintainer: Carlo Teubner <carlo@cteubner.net>
pkgname=runapp
pkgver=0.1.0
pkgrel=1
pkgdesc="Application runner for Linux desktop environments that integrate with systemd"
arch=('x86_64')
depends=('systemd-libs')
url="https://github.com/c4rlo/runapp"
license=('MIT')
source=("https://github.com/c4rlo/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('31ee6250b0f450f0fb65271b61eb2f5c501f9e2a9c2667c123f46b71e92ec4c5')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" prefix=/usr install_runner= install
}

# vim:set ts=2 sw=2 et:

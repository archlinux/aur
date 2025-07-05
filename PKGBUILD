# Maintainer: Carlo Teubner <carlo@cteubner.net>
pkgname=runapp
pkgver=0.2.0
pkgrel=1
pkgdesc="Application runner for Linux desktop environments that integrate with systemd"
arch=('x86_64')
depends=('systemd-libs')
url="https://github.com/c4rlo/runapp"
license=('MIT')
source=("https://github.com/c4rlo/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('65c1a95a67fe6442224cccc015b65115fc30ecd763f46dee1ed79c59322131ed')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" prefix=/usr install_runner= install
}

# vim:set ts=2 sw=2 et:

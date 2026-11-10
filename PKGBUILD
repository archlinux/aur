# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=sweetidle-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Lightweight idle management daemon for Wayland compositors"
arch=('x86_64')
url="https://github.com/sweetwm/sweetidle"
license=('GPL-3.0-or-later')
provides=('sweetidle')
conflicts=('sweetidle')
options=('!debug' '!strip')
depends=('glibc' 'libgcc')
optdepends=('systemd: logind sleep/lock hooks and the bundled user service')
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/sweetidle-$pkgver-x86_64-linux.tar.xz")
sha256sums=('59332e40ece4e5b2bc4b845ba6f2c0f9db9e49e046470d90a7eb5aaee980c8f1')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}

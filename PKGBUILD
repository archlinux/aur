# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=sweetidle-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight idle management daemon for Wayland compositors"
arch=('x86_64')
url="https://github.com/naurissteins/sweetidle"
license=('GPL-3.0-or-later')
provides=('sweetidle')
conflicts=('sweetidle')
options=('!debug' '!strip')
depends=('glibc' 'libgcc')
optdepends=('systemd: logind sleep/lock hooks and the bundled user service')
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/sweetidle-$pkgver-x86_64-linux.tar.xz")
sha256sums=('611696a1aede232a4aea532f6d479257a9d78a71844a23289da65512735fa55a')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}

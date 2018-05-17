# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=qobuz-desktop-player
_debpkgver=0.1.0_amd64
pkgver=0.1.0
pkgrel=1
pkgdesc="Qobuz desktop player"
arch=('x86_64')
url="https://github.com/nlarche/qobuz-desktop-player/releases"
license=('MIT')
#depends=()
source=("https://github.com/nlarche/qobuz-desktop-player/releases/download/v$pkgver/qobuz-desktop-player_$_debpkgver.deb")
sha256sums=('SKIP')

package() {
 cd "$srcdir"
  bsdtar xf data.tar.xz -C "$pkgdir"
}

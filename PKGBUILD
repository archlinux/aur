# Maintainer: skankingpickle <youremail@domain.com>
pkgname='polybar-now-playing-git'
pkgver=1
pkgrel=1
pkgdesc="Script for polybar to display and control media (not only Spotify)using DBus"
arch=('any')
url="https://github.com/d093w1z/polybar-now-playing.git"
license=('GPL')
depends=('python3' 'playerctl' 'dbus-python' 'ttf-font-awesome')
makedepends=('git')
provides=('polybar-now-playing')
source=('polybar-now-playing')
md5sums=('SKIP')

package() {
   install -D -t "$pkgdir/usr/bin" "$srcdir/polybar-now-playing"
}

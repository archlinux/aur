# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=cynicalteam-wallpapers
pkgver=2020.8.18
pkgrel=1
pkgdesc="A collection of cool wall papers!"
arch=('any')
url="https://github.com/TheCynicalTeam/wallpapers"
license=('GNU General Public License v3.0')
optdepends=('feh: Allows setting wallpaper' 'multimonitorlock-gui: Allows the background to be changed')
makedepends=('git')
source=("https://github.com/TheCynicalTeam/wallpapers/archive/$pkgver-$pkgrel.tar.gz")
sha256sums=("SKIP")

package() {
  mkdir -p $pkgdir/usr/share/backgrounds
	cp -a $srcdir/wallpapers-$pkgver-$pkgrel/cynicalteam $pkgdir/usr/share/backgrounds
}

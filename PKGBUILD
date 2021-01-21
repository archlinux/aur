# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=cynicalteam-wallpapers
pkgver=2021.01.01
pkgrel=1
pkgdesc="A collection of cool wall papers!"
arch=('any')
groups=('therepoclub')
url="https://github.com/TheCynicalTeam/wallpapers"
license=('CC BY-NC-SA 4.0')
optdepends=('feh: Allows setting wallpaper' 'multimonitorlock-gui: Allows the background to be changed')
makedepends=('git')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=("b12f39428af283dadbd2edaa3996e0085e7d7ae76ccefcdcbcc22533ce09eb6b")

package() {
  mkdir -p $pkgdir/usr/share/backgrounds
	cp -a $srcdir/wallpapers-$pkgver/cynicalteam $pkgdir/usr/share/backgrounds
}

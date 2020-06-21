# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=i3-maim
pkgver=1.3.0
pkgrel=1
pkgdesc="simple screenshot script using maim"
arch=('any')
url="https://github.com/TheCynicalTeam/i3-maim"
license=('GNU General Public License v3.0')
depends=('libnotify' 'maim' 'xdg-user-dirs' 'xdotool')
source=('i3-maim')
sha256sums=('7f2b69b1b6641b047170b43e5837959e62ded967b97071887debc9c47a170634')

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

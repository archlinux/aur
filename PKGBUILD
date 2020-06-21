# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=i3-cheat
pkgver=v1.0.0
pkgrel=1
pkgdesc="cheat sheet for i3wm"
arch=('any')
url="https://github.com/TheCynicalTeam/i3-cheat"
license=('GNU General Public License v3.0')
depends=('Gtk3' 'i3wm')
source=('i3-cheat')
sha256sums=('6191bcf3ab277b8b97bf3119346258a3d9ec7640a37ee25efebe4cefa40dc987')

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

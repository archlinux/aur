# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=i3-cheat
pkgver=v1.1.0
pkgrel=1
pkgdesc="cheat sheet for i3wm"
arch=('any')
url="https://aur.archlinux.org/packages/i3-cheat/"
license=('GNU General Public License v3.0')
depends=('gtk3' 'i3-wm')
source=('i3-cheat')
sha256sums=('735e5c407e9102f336441ff2383041c71a69206e5f95aa65b6cb0cbd39ad34b0')

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

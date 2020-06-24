# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=i3-maim
pkgver=v1.3.0
pkgrel=1
pkgdesc="simple screenshot script using maim"
arch=('any')
url="https://github.com/TheCynicalTeam/i3-maim"
license=('GNU General Public License v3.0')
depends=('libnotify' 'maim' 'xdg-user-dirs' 'xdotool')
source=('i3-maim')
sha256sums=('21d3e466b8bbfe1542f8210e42f1f17a268ee6c8464c9d6b701308c297caf09e')

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

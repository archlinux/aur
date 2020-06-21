# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=i3-maim
pkgver=1.2.0
pkgrel=1
pkgdesc="simple screenshot script using maim"
arch=('any')
url="https://github.com/TheCynicalTeam/i3-maim"
license=('GNU General Public License v3.0')
depends=('libnotify' 'maim' 'xdg-user-dirs' 'xdotool')
source=('i3-maim')
sha256sums=('7f2b69b1b6641b047170b43e5837959e62ded967b97071887debc9c47a170634')

pkgver()
{
  cd "$_pkgname"
  printf "v1.%s.0" "$(git rev-list --count HEAD)"
}

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

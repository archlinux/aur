# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=i3session
pkgver=v1.8.0
pkgrel=1
pkgdesc="Remembers what's running in your i3 workspaces by saving a session file"
arch=('any')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('GNU General Public License v3.0')
depends=(python2-xdg python-i3-py i3-wm xorg-xprop)
makedepends=('git')
source=("git://github.com/TheCynicalTeam/$pkgname.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  sed -i '1 s:/python:/env python2:' "$pkgname"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

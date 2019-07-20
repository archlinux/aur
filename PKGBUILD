# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=i3-scrot
pkgver=1.0
pkgrel=2
pkgdesc="simple screenshot script using scrot"
arch=('any')
url="https://gitlab.manjaro.org/packages/community/i3/i3-scrot"
license=('GPL')
depends=('libnotify'
	'scrot'
	'xdg-user-dirs')
source=('i3-scrot')
md5sums=('b6710609e1c14bd190bd049069ceb64e')

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

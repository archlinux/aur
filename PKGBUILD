# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=i3-scrot
pkgver=1.0
pkgrel=1
pkgdesc="simple screenshot script using scrot"
arch=('any')
url="https://forum.manjaro.org/index.php?topic=31977.msg261964#msg261964"
license=('GPL')
depends=('libnotify'
	'scrot'
	'xdg-user-dirs')
source=('i3-scrot')
md5sums=('b6710609e1c14bd190bd049069ceb64e')

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

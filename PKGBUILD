# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=i3-scrot
pkgver=2.1
pkgrel=2
pkgdesc="simple screenshot script using scrot"
arch=('any')
url="https://gitlab.manjaro.org/packages/community/i3/i3-scrot"
license=('GPL')
depends=('libnotify'
	'scrot'
        'xclip'
	'xdg-user-dirs')
source=('i3-scrot')
md5sums=('38d327f007f6cbd9113fa02ca516e532')

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# Maintainer: Pavel Dvorak <dvorapa~seznam~cz>

pkgname=apricity-icons
pkgver=3.36.pre
_pkgver=3.36-pre
pkgrel=1
pkgdesc="Apricity OS icon theme for Gnome or Cinnamon"
arch=(any)
url=https://github.com/dvorapa/apricity-icons/
license=(GPLv3)
depends=('gtk-update-icon-cache')
source=(apricity-icons-$_pkgver::https://github.com/dvorapa/$pkgname/archive/$_pkgver.tar.gz)
sha256sums=(68b214aa841ae600fff06362f307ef38b345d96d656a4bc5df4fce982e480e7c)

package() {
  optdepends=("gnome-tweaks: simple switch")

  cd "$srcdir/apricity-icons-$_pkgver"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "Apricity Icons/LICENSE"
  install -dm644 "$pkgdir/usr/share/icons"
  mv "Apricity Icons" "$pkgdir/usr/share/icons"
}

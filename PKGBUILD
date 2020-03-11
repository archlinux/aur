# Maintainer: Pavel Dvorak <dvorapa~seznam~cz>

pkgname=apricity-icons
pkgbase=apricity-icons
pkgver=3.36.pre
pkgrel=1
pkgdesc="Apricity OS icon theme for Gnome or Cinnamon"
arch=(any)
url=https://github.com/dvorapa/apricity-icons/
license=(GPLv3)
source=(apricity-icons-$pkgver::https://github.com/dvorapa/$pkgbase/archive/3.36-pre.tar.gz)
sha256sums=(68b214aa841ae600fff06362f307ef38b345d96d656a4bc5df4fce982e480e7c)

package_apricity-icons() {
  optdepends=("gnome-tweaks: simple switch")

  cd "$srcdir/apricity-icons-$pkgver"
  mv "Apricity Icons" /usr/share/icons
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

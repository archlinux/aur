# Maintainer: Pavel Dvorak <dvorapa~seznam~cz>

pkgname=apricity-icons
pkgver=3.36.post
_pkgver=3.36-post
pkgrel=2
pkgdesc="Apricity OS icon theme for Gnome or Cinnamon"
arch=(any)
url=https://github.com/dvorapa/apricity-icons/
license=(GPLv3)
depends=('gtk-update-icon-cache')
source=(apricity-icons-$_pkgver::https://github.com/dvorapa/$pkgname/archive/$_pkgver.tar.gz)
sha256sums=(93665a72bb635cf52de3c653194a12ba864e0eee0b4b2b87e575b02bea39311c)

package() {
  optdepends=("gnome-tweaks: simple switch")

  cd "$srcdir/apricity-icons-$_pkgver"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "Apricity Icons/LICENSE"
  install -dm755 "$pkgdir/usr/share/icons"
  mv "Apricity Icons" "$pkgdir/usr/share/icons"
}

# Maintainer: Pavel Dvorak <dvorapa~seznam~cz>

pkgname=apricity-icons
pkgver=40.post
_pkgver=40-post
pkgrel=3
pkgdesc="Apricity OS icon theme for Gnome or Cinnamon"
arch=(any)
url=https://github.com/dvorapa/apricity-icons/
license=(GPLv3)
depends=(gtk-update-icon-cache)
source=("apricity-icons-$_pkgver::https://github.com/dvorapa/$pkgname/archive/$_pkgver.tar.gz")
sha256sums=(13073f265d311d66e5dd9a95eb41e2368634b0c4e414a4dd24a10e547ab68856)

package() {
  optdepends=("gnome-tweaks: simple switch")

  cd "$srcdir/apricity-icons-$_pkgver"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "Apricity Icons/LICENSE"
  install -dm755 "$pkgdir/usr/share/icons"
  mv "Apricity Icons" "$pkgdir/usr/share/icons"
}

# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=public_suffix_list
pkgver=20151126
pkgrel=1
pkgdesc='List of "public suffixes" under which Internet users can (or historically could) directly register names'
arch=('any')
url="https://publicsuffix.org/"
license=('MPL')
source=("https://publicsuffix.org/list/public_suffix_list.dat")

package() {
  cd "$srcdir"
  install -Dm644 public_suffix_list.dat "$pkgdir/usr/share/publicsuffix/effective_tld_names.dat"
}
sha256sums=('7a159638a3dd0b16dea51fe57434894345892f7e207cf29a5bd0e8d79278ebd4')

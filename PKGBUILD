# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=public_suffix_list
pkgver=20151204
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
sha256sums=('873ea3f5bdcbe305ef09981af819d1ad95c6e0d8af3a9b0e6a1637e6507700c6')

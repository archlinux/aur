# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=public_suffix_list
pkgver=20151205
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
sha256sums=('4c76a577e4356ed7da9e8a8bfa8102b5e58dbaf16548110e6babedb9561b8381')

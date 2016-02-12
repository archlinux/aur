# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=public_suffix_list
pkgver=20160212
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
sha256sums=('2ad536bf32e7a54cd31a64a463371f7ee2548530f664e932ba03aeab9a50c559')

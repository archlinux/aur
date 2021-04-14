# Maintainer: André Kugland <kugland@gmail.com>

pkgname=pwned.pl
pkgver=2019.1208.0012
pkgrel=1
pkgdesc="Pwned Password API lookup tool"
url="https://github.com/mikepound/pwned-search"
license=('GPL3')
arch=('any')
depends=('perl' 'perl-www-curl')
source=('https://raw.githubusercontent.com/mikepound/pwned-search/cccf6ba8c048de1e0ab65ffd0f9f2dd76e2a7566/pwned.pl')
sha512sums=('eb18597c5f3df243c816a9d945ae471258145b131710343f86647ef2c58d68ea05f163117f6a4bb2a74700c72bad2b08dc61ca15d83b03d44b72ba1ab467bbd0')

package() {
  install -D -m755 -o0 -g0 "pwned.pl" "$pkgdir/usr/bin/pwned.pl"
}

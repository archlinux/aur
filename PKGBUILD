# Maintainer: Fabius
# Contributor: Stefan Heinemann <stefan.heinemann@codedump.ch>

_pkgname=pg_query
pkgname=ruby-pg-query
pkgver=1.1.0
pkgrel=1
pkgdesc="Ruby extension to parse, deparse and normalize SQL queries using the PostgreSQL query parser"
arch=(any)
url="https://github.com/lfittl/pg_query"
license=('BSD-3-CLAUSE')
makedepends=("rubygems")
depends=()
optdepends=()
source=("https://rubygems.org/downloads/$_pkgname-$pkgver.gem")
noextract=("$_pkgname-$pkgver.gem")
sha256sums=("dc240116e0101950f0de9239b7d841d6b2ad4534b6f82a08755603d964f2111c")


package() {
	local _gemdir="$(ruby -r rubygems -e"puts Gem.default_dir")"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_pkgname-$pkgver.gem"
}

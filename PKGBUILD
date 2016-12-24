# Maintainer: Stefan Heinemann <stefan.heinemann@codedump.ch>

_pkgname=pg_query
pkgname=ruby-pg-query
pkgver=0.11.3
pkgrel=1
pkgdesc="Parses SQL queries using a copy of the PostgreSQL server query parser"
arch=("any")
url="https://github.com/lfittl/pg_query"
license=("BSD-3-CLAUSE")
depends=()
makedepends=("rubygems")
source=("http://gems.rubyforge.org/gems/$_pkgname-$pkgver.gem")
noextract=("$_pkgname-$pkgver.gem")
sha256sums=("ce27b75d638197071f35755a5de47897d9c8b3d075484805a526149c9e35e32f")


package() {
	local _gemdir="$(ruby -rubygems -e"puts Gem.default_dir")"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_pkgname-$pkgver.gem"
}

# Maintainer: Joakim Reinert <mail@jreinert.com>

_gemname=xapian-findex
pkgname=ruby-$_gemname
pkgver=0.1.2
pkgrel=1
pkgdesc='A simple file indexer and full text search using Xapian'
arch=(any)
url='https://github.com/jreinert/findex'
license=(MIT)
depends=(ruby ruby-xapian ruby-filemagic)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('9565e9b4061632eb973461fe465c9f79fa5d40c2f44b2122c6f5b4e49096bdfa')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

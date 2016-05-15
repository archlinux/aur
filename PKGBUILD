# Maintainer: Joakim Reinert <mail@jreinert.com>

_gemname=xapian-findex
pkgname=ruby-$_gemname
pkgver=0.1.3
pkgrel=1
pkgdesc='A simple file indexer and full text search using Xapian'
arch=(any)
url='https://github.com/jreinert/findex'
license=(MIT)
depends=(ruby ruby-xapian ruby-filemagic)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('b7d429b4715418f67ef103e0545a41fa59eb637240654a33cc68681ca19297b7')

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

# Maintainer: Joakim Reinert <mail@jreinert.com>

_gemname=xapian-findex
pkgname=ruby-$_gemname
pkgver=0.1.1
pkgrel=1
pkgdesc='A simple file indexer and full text search using Xapian'
arch=(any)
url='https://github.com/jreinert/findex'
license=(MIT)
depends=(ruby ruby-xapian ruby-filemagic)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('3fd1d16a64cbc0ad078ec3ef942ca8dc25c63ae82311f4140ada56bf3e44dd92')

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

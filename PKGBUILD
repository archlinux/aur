# Generated with gembuild (https://github.com/mfinelli/gembuild)
# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=net-http-digest_auth
pkgname=ruby-$_gemname
pkgver=1.4
pkgrel=1
pkgdesc='An implementation of RFC 2617 - Digest Access Authentication.'
arch=('any')
url='http://github.com/drbrain/net-http-digest_auth'
options=(!emptydirs)
noextract=($_gemname-$pkgver.gem)
depends=('ruby')
makedepends=('rubygems')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('11f7a8c13e801455dedd8864339d5fcd6536949b99ec9b3eae193c32f20b0091')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}

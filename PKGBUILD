# Generated with gembuild (https://github.com/mfinelli/gembuild)
# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=netrc
pkgname=ruby-$_gemname
pkgver=0.10.3
pkgrel=1
pkgdesc='This library can read and update netrc files, preserving formatting including comments and whitespace.'
arch=('any')
url='https://github.com/geemus/netrc'
license=('MIT')
options=(!emptydirs)
noextract=($_gemname-$pkgver.gem)
depends=('ruby')
makedepends=('rubygems')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('8fa24558ed46e2b2d9a58baa78fd7d11cb7efa3ec7e2ec89a057f76dc3abcce4')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}

# Generated with gembuild (https://github.com/mfinelli/gembuild)
# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=ntlm-http
pkgname=ruby-$_gemname
pkgver=0.1.1
pkgrel=1
pkgdesc='Ruby/NTLM HTTP provides NTLM authentication over http.'
arch=('any')
url='http://www.mindflowsolutions.net'
options=(!emptydirs)
noextract=($_gemname-$pkgver.gem)
depends=('ruby')
makedepends=('rubygems')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('66b463ce8a9bf720045786df26cfec4a800f91fb7847af83f2fc209e9d0ba07b')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}

# Contributor: gem2arch 0.1
# Contributor: theapodan

pkgname=ruby-htmlentities
_pkgname=htmlentities
pkgver=4.3.4
pkgrel=1
pkgdesc='http://htmlentities.rubyforge.org/'
arch=('any')
url='http://htmlentities.rubyforge.org/'
license=('GPL')
depends=('ruby')
source=("http://gems.rubyforge.org/gems/$_pkgname-$pkgver.gem")
noextract=("$_pkgname-$pkgver.gem")
sha256sums=('125a73c6c9f2d1b62100b7c3c401e3624441b663762afa7fe428476435a673da')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_pkgname-$pkgver.gem
}

# vim:set ts=2 sw=2 et:

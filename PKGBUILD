# Contributor: gem2arch 0.1
# Contributor: theapodan

pkgname=ruby-htmlentities
_pkgname=htmlentities
pkgver=4.3.3
pkgrel=1
pkgdesc='http://htmlentities.rubyforge.org/'
arch=('any')
url='http://htmlentities.rubyforge.org/'
license=('GPL')
depends=('ruby')
source=("http://gems.rubyforge.org/gems/$_pkgname-$pkgver.gem")
noextract=("$_pkgname-$pkgver.gem")
sha256sums=('178c50f656077512d33e0786f924cb0a2281881c3fcd3e1b8e070a6cec15956c')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_pkgname-$pkgver.gem
}

# vim:set ts=2 sw=2 et:

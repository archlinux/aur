# Generated with gembuild (https://github.com/mfinelli/gembuild)
# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=scss_lint
pkgname=ruby-$_gemname
pkgver=0.52.0
pkgrel=1
pkgdesc='Configurable tool for writing clean and consistent SCSS.'
arch=('any')
url='https://github.com/brigade/scss-lint'
license=('MIT')
options=(!emptydirs)
noextract=($_gemname-$pkgver.gem)
depends=('ruby' 'ruby-sass' 'ruby-rainbow')
makedepends=('rubygems')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('cd1d9182baabeb073276ecca5d9ed0f9fd5f01d3e1b6eb8c03247226dfac5587')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}

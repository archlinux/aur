# Generated with gembuild (https://github.com/mfinelli/gembuild)
# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=scss_lint
pkgname=ruby-$_gemname
pkgver=0.53.0
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
sha256sums=('668b2a4aed536364b63854745c4d2bd316b22cd07069ef008133405c5e290efe')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}

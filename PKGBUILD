# Generated with gembuild (https://github.com/mfinelli/gembuild)
# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=webrobots
pkgname=ruby-$_gemname
pkgver=0.1.2
pkgrel=1
pkgdesc='This library helps write robots.txt compliant web robots in Ruby.'
arch=('any')
url='https://github.com/knu/webrobots'
license=('2-clause BSDL')
options=(!emptydirs)
noextract=($_gemname-$pkgver.gem)
depends=('ruby')
makedepends=('rubygems')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('ebbcaa2cb4930fa1b83206f432c5cb64746507b2dcf50ea1301569a4d662cda6')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}

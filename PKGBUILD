# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=ruby-celluloid
pkgver=0.17.1.2
_realname="celluloid"
pkgrel=1
pkgdesc="Actor-based concurrent object framework for Ruby"
arch=('any')
url="https://celluloid.io/"
license=("MIT")
depends=('ruby' 'ruby-timers')
source=("http://gems.rubyforge.org/gems/$_realname-$pkgver.gem")
noextract=($real_name-$pkgver.gem)
md5sums=('b9e83eafce24171a83536b13e9c6ba39')

package() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" ${_realname}-$pkgver.gem
}

# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Sid Karunaratne <sid@karunaratne.net>

pkgname=ruby-timers
pkgver=4.0.1
_realname="timers"
pkgrel=1
pkgdesc="Pure Ruby one-shot and periodic timers"
arch=('any')
url="https://rubygems.org/gems/timers"
license=("MIT")
depends=('ruby-hitimes')
source=(http://gems.rubyforge.org/gems/$_realname-$pkgver.gem)
noextract=($real_name-$pkgver.gem)

package() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" ${_realname}-$pkgver.gem
}

sha256sums=('f45ca1b8ce6b26e29226c2144c512801a9019c3e781054d878c205cb0fd8500d')

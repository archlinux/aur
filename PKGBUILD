# Generated with gembuild (https://github.com/mfinelli/gembuild)
# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=mechanize
pkgname=ruby-$_gemname
pkgver=2.7.4
pkgrel=1
pkgdesc='The Mechanize library is used for automating interaction with websites.'
arch=('any')
url='http://docs.seattlerb.org/mechanize/'
license=('MIT')
options=(!emptydirs)
noextract=($_gemname-$pkgver.gem)
depends=('ruby' 'ruby-domain_name' 'ruby-http-cookie' 'ruby-mime-types' 'ruby-net-http-digest_auth' 'ruby-net-http-persistent' 'ruby-nokogiri' 'ruby-ntlm-http' 'ruby-webrobots')
makedepends=('rubygems')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('1799d05733a1176a32179a210345a555b9a2bba4d1e2977f17fdcdf114aa6dd2')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}

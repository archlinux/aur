# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux AT free DOT fr>

pkgname=ruby-git_remote_branch
_pkgname=git_remote_branch
pkgver=0.3.5
pkgrel=2
pkgdesc="git_remote_branch is a learning tool to ease the interaction with remote branches in simple situations."
arch=(any)
url="https://rubygems.org/gems/git_remote_branch"
license=('MIT')
depends=('ruby' 'ruby-rainbow' 'git')
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_pkgname-$pkgver.gem)
noextract=($_pkgname-$pkgver.gem)
md5sums=('54c6dfb9d13a57b605458ddc44ec02bf')

build() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" $_pkgname-$pkgver.gem
}

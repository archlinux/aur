# $Id$
# Maintainer: Olivier Mehani <shtrom-aur@ssji.net>
# PKGBUILD generated  with gem2arch-1.0-1
# vim:set ts=2 sw=2 et:
pkgname=ruby-tmail
pkgver=1.2.7.1
pkgrel=1
pkgdesc="Ruby Mail Handler"
arch=('any')
url="http://tmail.rubyforge.org"
license=(MIT)
depends=('ruby')
makedepends=('rubygems')
source=("http://gems.rubyforge.org/gems/tmail-${pkgver}.gem")
noextract=("tmail-${pkgver}.gem")

build() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" tmail-$pkgver.gem \
  -n "$pkgdir/usr/bin"
}

md5sums=('443692ec927ea28c15f66baf9e0ac550')

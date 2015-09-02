# vim:set ts=2 sw=2 et:
# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  <aaron.l.france@gmail.com>
pkgname=bumperl
pkgver=0.0.1
pkgrel=1
pkgdesc="Semantic version bumper for Erlang/OTP apps"
arch=('i686' 'x86_64')
url="https://github.com/aerosol/bumperl"
license=('MIT')
depends=('erlang')
makedepends=('git' 'rebar' 'erlang')
provides=('bumperl')
source=('git://github.com/aerosol/bumperl.git')
md5sums=('SKIP')

build() {
  cd $pkgname
  make deps compile escript
  install -D "$pkgname" "$pkgdir/usr/bin/$pkgname" || return 1
}

# vim:set ts=2 sw=2 et:

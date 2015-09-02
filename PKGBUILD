# vim:set ts=2 sw=2 et:
# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  <aaron.l.france@gmail.com>
pkgname=entop
pkgver=0.0.1
pkgrel=1
pkgdesc="A top-like tool for monitoring an Erlang node"
arch=('i686' 'x86_64')
url="https://github.com/mazenharake/entop.git"
license=('apache')
depends=('erlang')
makedepends=('git' 'erlang')
provides=('entop')
source=('git://github.com/mazenharake/entop.git')
md5sums=('SKIP')

build() {
  cd $pkgname
  install -D "$pkgname" "$pkgdir/usr/bin/$pkgname" || return 1
}

# vim:set ts=2 sw=2 et:

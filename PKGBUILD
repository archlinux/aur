# $Id$
# Maintainer: winlu <derwinlu@gmail.com>

pkgname=rebar3-zsh
pkgver=3.1.0
pkgrel=1
pkgdesc="ZSH completion for rebar3."
arch=('any')
url="https://github.com/rebar/rebar3"
license=('APACHE')
depends=('zsh' 'rebar3')
source=("rebar3-$pkgver.tar.gz::https://github.com/rebar/rebar3/archive/${pkgver}.tar.gz")
md5sums=('bd0e04ab64a5784491a67c8690d6620d')

package() {
  cd "$srcdir/rebar3-$pkgver"
  install -Dm0644 "priv/shell-completion/zsh/_rebar3" "$pkgdir/usr/share/zsh/site-functions/_rebar3"
}

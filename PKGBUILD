# $Id$
# Maintainer: winlu <derwinlu@gmail.com>

pkgname=rebar3-zsh
pkgver=3.3.4
pkgrel=1
pkgdesc="ZSH completion for rebar3."
arch=('any')
url="https://github.com/rebar/rebar3"
license=('APACHE')
depends=('zsh' 'rebar3='$pkgver)
source=("rebar3-$pkgver.tar.gz::https://github.com/rebar/rebar3/archive/${pkgver}.tar.gz")
md5sums=('4f8f839a4b5ef0633b31f3b98a993c31')

package() {
  cd "$srcdir/rebar3-$pkgver"
  install -Dm0644 "priv/shell-completion/zsh/_rebar3" "$pkgdir/usr/share/zsh/site-functions/_rebar3"
}

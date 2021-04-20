# $Id$
# Maintainer: winlu <derwinlu@gmail.com>

pkgname=rebar3-zsh
pkgver=3.14.4
pkgrel=2
pkgdesc="ZSH completion for rebar3."
arch=('any')
url="https://github.com/erlang/rebar3"
license=('APACHE')
depends=('zsh' 'rebar3')
source=("https://raw.githubusercontent.com/erlang/rebar3/${pkgver}/priv/shell-completion/zsh/_rebar3")
md5sums=('0ea7182cab18aa959376a0a9993f6f13')

package() {
  install -Dm0644 "${srcdir}/_rebar3" "$pkgdir/usr/share/zsh/site-functions/_rebar3"
}

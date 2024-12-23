# $Id$
# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>
# Maintainer: winlu <derwinlu@gmail.com>

pkgname=rebar3-zsh
pkgver=3.24.0
pkgrel=1
pkgdesc="ZSH completion for rebar3."
arch=('any')
url="https://github.com/erlang/rebar3"
license=('APACHE')
depends=('zsh' 'rebar3')
_filename="_rebar3_${pkgver}"
source=("${_filename}::https://raw.githubusercontent.com/erlang/rebar3/${pkgver}/apps/rebar/priv/shell-completion/zsh/_rebar3")
sha256sums=('3f7dd5cd43d00ae6c4be7f147fe2434c7ce8b2c7ac70b6d347dd93fa6ef7bf90')


package() {
  install -Dm0644 "${srcdir}/${_filename}" "$pkgdir/usr/share/zsh/site-functions/_rebar3"
}

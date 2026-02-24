# Maintainer: Sergey Zarechnev <da_kurlzzzzz@mail.ru>

pkgname=vim-ollama
pkgver=1.2.0
pkgrel=1
pkgdesc="This plugin adds Copilot-like code completion support to Vim"
arch=(any)
url="https://github.com/gergap/vim-ollama"
license=(GPL-3.0-only)
groups=('vim-plugins')
depends=('vim')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("git+${url}#tag=V${pkgver}")
sha256sums=(SKIP)

package() {
  cd "$srcdir/$pkgname"
  installpath="${pkgdir}/usr/share/vim/vimfiles"
  find autoload doc plugin python -type d -exec install -d ${installpath}/{} \;
  cp -r autoload doc plugin python $installpath
}

# vim: ft=sh

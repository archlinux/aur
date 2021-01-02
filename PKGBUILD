# Maintainer: Gasparotto Mattia <gasmat04@gmail.com>

pkgname=yadr
pkgver=1
pkgrel=1
pkgdesc="The best vim,git,zsh plugins and the cleanest vimrc you've ever seen."
arch=('x86_64')
url="http://skwp.github.io/dotfiles/"
license=('BSD-2-Clause')
depends=('sh')
makedepends=('git')
provides=('yadr')
source=('.$pkgname::https://github.com/skwp/dotfiles.git')
md5sums=('SKIP')

package() {
	read -p "Install all components or ask for each one? [INSTALL/ask] " UORI
    if [[ $UORI = "ask" || $UORI = "ASK" ]]; then
    	sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh`"
    else
    	sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh`" -s ask
    fi
}

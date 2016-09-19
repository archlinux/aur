
# Maintainer: Luke Chen Shui <chenshuiluke@gmail.com>
pkgname=spacemacs-git
_pkgname=spacemacs
pkgver=5512
pkgrel=1
epoch=
pkgdesc="The best editor is neither Emacs nor Vim, it's Emacs and Vim!"
arch=('i686' 'x86_64')
url="http://spacemacs.org/"
depends=('emacs')
source=("git+https://github.com/syl20bnr/spacemacs.git")
md5sums=('SKIP')
pkgver() {
  cd "$_pkgname"
  git rev-list --count HEAD
}

package() {
	cd "$_pkgname"
	if [ ! -d ~/.emacs.d ]; then
	  mkdir ~/.emacs.d
	fi
	cp -r * ~/.emacs.d
}

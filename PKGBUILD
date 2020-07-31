# Maintainer: koraynilay <koray.fra@gmail.com>
_filename="bash.command-not-found"
pkgname=bash-zsh-insulter
pkgver=1
pkgrel=1
pkgdesc="Insults the user when typing wrong command. For Bash v4+ or Zsh"
arch=('any')
url="https://github.com/hkbakke/bash-insulter"
license=('MIT')
install="bash-zsh-insulter.install"
source=("$_filename::https://raw.githubusercontent.com/hkbakke/bash-insulter/master/src/bash.command-not-found")
md5sums=("757b466982999fe563256ed0e3d6e6bb")

package() {
	install -Dm0644 $_filename "$pkgdir/etc/$_filename"
}

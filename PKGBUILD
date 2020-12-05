# Maintainer: Marko Korhonen <aur@marko.korhonen.cc>

pkgname=fzf-pass
pkgver=0.1
pkgrel=1
pkgdesc="FZF frontend for pass written in bash"
arch=('any')
url='https://github.com/FunctionalHacker/fzf-pass'
license=('GPL')
depends=('fzf' 'pass' 'ydotool')
source=('https://gitlab.com/FunctionalHacker/fzf-pass/raw/2533521513b12b1db07bc37cc9087a3e76eb624b/fzf-pass')

package() {
	install -Dm755 fzf-pass ${pkgdir}/usr/bin/fzf-pass
}
md5sums=('5d83e760ca538380a28b56420f6a858e')

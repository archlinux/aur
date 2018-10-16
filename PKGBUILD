# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@protornmail.com>
pkgname=fzf-git-bindings-gist
pkgver=r20180616.1
pkgrel=1
pkgdesc="Key bindings for git with fzf."
arch=('any')
url="https://junegunn.kr/2016/07/fzf-git/"
license=('custom')
depends=('fzf' 'git')
install=$pkgname.install
source=(
	'https://gist.githubusercontent.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236/raw/3dc286fb5873ad244375b8fb22dfad1b1d9c5d99/functions.sh'
	'https://gist.githubusercontent.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236/raw/3dc286fb5873ad244375b8fb22dfad1b1d9c5d99/key-binding.bash'
	'https://gist.githubusercontent.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236/raw/3dc286fb5873ad244375b8fb22dfad1b1d9c5d99/key-binding.zsh'
)
md5sums=('05a7d0a3affe85a8e4869f482af1c5d3'
         '949504496bf8f391fb62bec52e9b6390'
         '2f024f6eb7345bd004e8685965874b4b')

package() {
	mkdir -p "$pkgdir/usr/share/fzf-git-bindings"
	install -Dm755 "functions.sh" "$pkgdir/usr/share/fzf-git-bindings/functions.sh"
	install -Dm755 "key-binding.bash" "$pkgdir/usr/share/fzf-git-bindings/key-binding.bash"
	install -Dm755 "key-binding.zsh" "$pkgdir/usr/share/fzf-git-bindings/key-binding.zsh"
}

# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=fzf-git-bindings-gist
pkgver=r20190314.1
pkgrel=1
pkgdesc="Key bindings for git with fzf."
arch=('any')
url="https://junegunn.kr/2016/07/fzf-git/"
license=('custom')
depends=('fzf' 'git')
install=$pkgname.install
source=(
	'https://gist.githubusercontent.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236/raw/be535c93284afde06342526de9476eb15071e78a/functions.sh'
	'https://gist.githubusercontent.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236/raw/be535c93284afde06342526de9476eb15071e78a/key-binding.bash'
	'https://gist.githubusercontent.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236/raw/be535c93284afde06342526de9476eb15071e78a/key-binding.zsh'
)
md5sums=('df4bd3be70d60dbce47d3dd3eaff3b3b'
         '949504496bf8f391fb62bec52e9b6390'
         '2f024f6eb7345bd004e8685965874b4b')

package() {
	mkdir -p "$pkgdir/usr/share/fzf-git-bindings"
	install -Dm755 "functions.sh" "$pkgdir/usr/share/fzf-git-bindings/functions.sh"
	install -Dm755 "key-binding.bash" "$pkgdir/usr/share/fzf-git-bindings/key-binding.bash"
	install -Dm755 "key-binding.zsh" "$pkgdir/usr/share/fzf-git-bindings/key-binding.zsh"
}

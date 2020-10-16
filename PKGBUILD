# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=fzf-git-bindings-gist
pkgver=r20200924.1
pkgrel=1
pkgdesc="Key bindings for git with fzf."
arch=('any')
url="https://junegunn.kr/2016/07/fzf-git/"
license=('custom')
depends=('fzf' 'git')
install=$pkgname.install
source=(
	'https://gist.githubusercontent.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236/raw/0fc65a1e6560dd59a469959fa74b1e2c3cfba9a1/functions.sh'
	'https://gist.githubusercontent.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236/raw/0fc65a1e6560dd59a469959fa74b1e2c3cfba9a1/key-binding.bash'
	'https://gist.githubusercontent.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236/raw/0fc65a1e6560dd59a469959fa74b1e2c3cfba9a1/key-binding.zsh'
)
md5sums=('6914bc5c87d1c0c06f58e01a1ad6481a'
         '530a4d5a32f6ff23be9f0b3df6f049b4'
         'ac47ca3a465e06854b9c6d55a475e3de')

package() {
	mkdir -p "$pkgdir/usr/share/fzf-git-bindings"
	install -Dm755 "functions.sh" "$pkgdir/usr/share/fzf-git-bindings/functions.sh"
	install -Dm755 "key-binding.bash" "$pkgdir/usr/share/fzf-git-bindings/key-binding.bash"
	install -Dm755 "key-binding.zsh" "$pkgdir/usr/share/fzf-git-bindings/key-binding.zsh"
}

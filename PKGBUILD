# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=fzf-git-bindings-gist
pkgver=r20220126.1
pkgrel=1
pkgdesc="Key bindings for git with fzf."
arch=('any')
url="https://junegunn.kr/2016/07/fzf-git/"
license=('custom')
depends=('fzf' 'git')
install=$pkgname.install
source=(
	'https://gist.githubusercontent.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236/raw/f23942b51333b8e8bcd6816fc063cf54beb8b97f/functions.sh'
	'https://gist.githubusercontent.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236/raw/f23942b51333b8e8bcd6816fc063cf54beb8b97f/key-binding.bash'
	'https://gist.githubusercontent.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236/raw/f23942b51333b8e8bcd6816fc063cf54beb8b97f/key-binding.zsh'
)
b2sums=('0abea5683adda22e8b1f37d9b11b0dbdd9ad98aa65c9980fedd5425a98cae756ff554d08f1abd3c9c723cf870ca422d12ec7e0bd80fe8be5c9a640c30ab4ec7b'
        '75759c7fdb9043ecd9d1ae60fba8582635d021c5519b0335bc01d4e982564ec39006af8286f5026699fb574d9904c80af4aebeea877f81013ea8739a11ddfaaf'
        '1861f46a63d7d5f09188614543bcda6f74732423d5b768b3de78778923524bc09ac4e99d63b2721166accf4744acdb7e10c76a29f59322b60a7ced586b2326a3')

package() {
	mkdir -p "$pkgdir/usr/share/fzf-git-bindings"
	install -Dm755 "functions.sh" "$pkgdir/usr/share/fzf-git-bindings/functions.sh"
	install -Dm755 "key-binding.bash" "$pkgdir/usr/share/fzf-git-bindings/key-binding.bash"
	install -Dm755 "key-binding.zsh" "$pkgdir/usr/share/fzf-git-bindings/key-binding.zsh"
}

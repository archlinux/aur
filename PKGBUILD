# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=mtaaat
pkgver=1.0
pkgrel=1
arch=('any')
source=(
		'black_pycharm_formatter.sh'
		'black_pycharm_formatter.py')
sha512sums=(
		'4bd270faafdaf932382678b558fc8bcbb2f6510bf4bda04f190af6507403fe1b8dfc518100b4a1651feb4dfb5dbfda98f0b474435ddfd12e07d827403db82a50'
		'5ebc924a174d9f8663f785c656da90cc40e73f3013eeb133ec00ea39cd4c7073926c0a6dcae903da9d9b496c9a135fdeb3b060bc15407d0697a7af07a103d73d')

package() {
    install -Dm755 $srcdir/black_pycharm_formatter.sh $pkgdir/usr/bin/black_pycharm_formatter.sh
    install -Dm755 $srcdir/black_pycharm_formatter.py $pkgdir/usr/bin/black_pycharm_formatter.py
}

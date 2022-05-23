# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=mtaaat
pkgver=1.0
pkgrel=1
arch=('any')
source=(
	'black_pycharm_formatter.sh'
	'black_pycharm_formatter.py')
sha512sums=(
	'e68cc3887e5b4f573507aaa3db068639158ecb405b3b7dc4521942b4ff80e8e0f3137792f193451103a816340cc6ad81c6a47e0427582fb6797f48f39ca5e24a'
	'9569ff2f472db738c249dc7109bce024e9bd3b83b02aa2bfe188ce40c1204e25efa12f497ffafac8d813e9578629d9926f76060fe832caa8b0b903e2bfebb7ee')

package() {
	install -Dm755 $srcdir/black_pycharm_formatter.sh $pkgdir/usr/bin/black_pycharm_formatter.sh
	install -Dm755 $srcdir/black_pycharm_formatter.py $pkgdir/usr/bin/black_pycharm_formatter.py
}

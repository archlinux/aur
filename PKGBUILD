# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=mtaaat
pkgver=1.0
pkgrel=1
arch=('any')
source=(
	'black_pycharm_formatter.sh'
	'black_pycharm_formatter.py')
sha512sums=(
	'60c4d75216af39c0eee0e9c9c8d38e68f128c05339b1cbba83ef99c2e2433ec6e2bbee9347a37b90f56c34e05d356902040901d2bb426c1bb2e0f39b7cc36c26'
	'0309e5dc050e3b87e8466d83158460a4ac18058a7e74d950d2e3113243ac48d5e1c9f22ae881c9d1924a451159878246ec77a870f5979b1e8b7d0dd816d2d6a6')

package() {
	install -Dm755 $srcdir/black_pycharm_formatter.sh $pkgdir/usr/bin/black_pycharm_formatter.sh
	install -Dm755 $srcdir/black_pycharm_formatter.py $pkgdir/usr/bin/black_pycharm_formatter.py
}

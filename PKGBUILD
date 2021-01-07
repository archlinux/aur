# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=mtaaat
pkgver=1.0
pkgrel=1
arch=('any')
source=(
		'black_pycharm_formatter.sh'
		'black_pycharm_formatter.py')
sha512sums=(
		'1d72a4733ee9a0c7dce4ca0bf2eb248867d47596e8f6f3a330d0cf85af425d2acfdd4b0854586f00856c75c7f2fa737336979465c6721cfdb68814117066753b' 
		'a69610e174c610ce66c7de66a11ad95366516288f6aabd0b7b6e89fabe68bd77fdf406193d4af92d8adc95493a7bc6deaefed9629941a231bf83d4ff6e41dbf8')

package() {
    install -Dm755 $srcdir/black_pycharm_formatter.sh $pkgdir/usr/bin/black_pycharm_formatter.sh
    install -Dm755 $srcdir/black_pycharm_formatter.py $pkgdir/usr/bin/black_pycharm_formatter.py
}

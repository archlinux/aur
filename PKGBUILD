# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=mtaaat
pkgver=1.0
pkgrel=1
arch=('any')
source=(
		'black_pycharm_formatter.sh'
		'black_pycharm_formatter.py')
sha512sums=(
		'6af3a8080908ab6dd19077c2870b0eb39fd4ad8d325d9805b40a86224bb2b81f3b37dfe25ca8d7188a29e7d50e07363196bae2b69115e02b62434396fc4ea586'
		'74244976ef65d4bc904771db6e4e87da527633be90bdeee91d1d02423ee5f16aecbd0cc0ca7bda99720ffb1a4c703ffd942b96872ef56ee0d1ed56bd355f79f0')

package() {
    install -Dm755 $srcdir/black_pycharm_formatter.sh $pkgdir/usr/bin/black_pycharm_formatter.sh
    install -Dm755 $srcdir/black_pycharm_formatter.py $pkgdir/usr/bin/black_pycharm_formatter.py
}

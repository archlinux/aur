# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=mtaaat
pkgver=1.0
pkgrel=1
arch=('any')
source=(
		'black_pycharm_formatter.sh'
		'black_pycharm_formatter.py')
sha512sums=(
		'225406bad821bbb07a17c14cd08fd120b9a8c774318c9cbd030347c711e922a222551ccc2cf43e81a7ff6e3e73ae1e8118c89e74a06b38d7ee0103aecb2cd46b' 
		'53acc31b700bd059dac2b475183da78a37a9f3e42383a1afac64a1066f59bf119a6a0d1c38a0e4d9eacbd9dc18fe0e62e6cda4f03449c47ad5e2667a1c060f8a')

package() {
    install -Dm755 $srcdir/black_pycharm_formatter.sh $pkgdir/usr/bin/black_pycharm_formatter.sh
    install -Dm755 $srcdir/black_pycharm_formatter.py $pkgdir/usr/bin/black_pycharm_formatter.py
}

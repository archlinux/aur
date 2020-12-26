# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=mtaaat
pkgver=1.0
pkgrel=1
arch=('any')
source=(
		'black_pycharm_formatter.sh'
		'black_pycharm_formatter.py')
sha512sums=(
		'2feb20d02f83e1f1c9411c9c599f7d9bda0e891214efe60925ddbc28c30550e81b1f57f2581496e0d4b250c6f0ef2380eb0c1034ea07aafdff217ea00ed86c7b' 
		'a7b3c2956d3d2b1dea49c83af2ebb1a29700bbd1fb621918a61fd28acb1bc2f925c6342b5eaa126bead6f0f260a16121299742fd0a051a1d87edcd34ced4b7c5')

package() {
    install -Dm755 $srcdir/black_pycharm_formatter.sh $pkgdir/usr/bin/black_pycharm_formatter.sh
    install -Dm755 $srcdir/black_pycharm_formatter.py $pkgdir/usr/bin/black_pycharm_formatter.py
}

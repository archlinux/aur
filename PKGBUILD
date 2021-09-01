# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=mtaaat
pkgver=1.0
pkgrel=1
arch=('any')
source=(
	'black_pycharm_formatter.sh'
	'black_pycharm_formatter.py')
sha512sums=(
	'f7e43a09d0a5063ccac25b53e780d647d3e35524ec56af20ba2dd9d11f758549908628d0ba91d074c92d7d2e7928d658f81f3d875a3fd1f285db9b6f1eeb717a'
	'ff148e708a3d00ac01f4164a18312480c9f7ced3ba4408f7c08f8ba75c3eedd2d644cdf4dc3802657d80cfffc10849483152d8bef59629f23ce4940f80104742')

package() {
	install -Dm755 $srcdir/black_pycharm_formatter.sh $pkgdir/usr/bin/black_pycharm_formatter.sh
	install -Dm755 $srcdir/black_pycharm_formatter.py $pkgdir/usr/bin/black_pycharm_formatter.py
}

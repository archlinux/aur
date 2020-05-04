# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=mtaaat
pkgver=1.0
pkgrel=1
arch=('any')
source=("black_pycharm_jupyter_cell_formatter.sh")
sha256sums=('cc40c2a090379f7b6747923482081de8d4a008c6f1fe4fb4bc6788b4e244ce22')

package() {
    chmod u+x $srcdir/black_pycharm_jupyter_cell_formatter.sh
    install -Dm644 $srcdir/black_pycharm_jupyter_cell_formatter.sh $pkgdir/usr/bin/black_pycharm_jupyter_cell_formatter.sh
}

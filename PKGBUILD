# Maintainer: Emil Rasmus Merzin <rasmusmerzin@gmail.com>
pkgname=zudoku
pkgver=1.0.0
pkgrel=1
pkgdesc='Git repository manager'
arch=('x86_64')
url='https://gitlab.com/rasmusmerzin/zudoku'
license=('MIT')
provides=('zudoku')
source=('https://downloads.sourceforge.net/project/zig-sudoku/zudoku-linux-64-1.0.0.tar.gz')
sha1sums=('395fc854f8206fcf0ef9bf8231b648d9a288409a')

package() {
	install -Dm755 "${srcdir}/zudoku" "${pkgdir}/usr/bin/zudoku"
}

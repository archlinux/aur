# Maintainer: Alex Grabowski <hurufu+aur@gmail.com>
pkgname=cs-prolog
pkgver=4.1
pkgrel=1
pkgdesc='A Prolog interpreter written in C#'
arch=(any)
url='https://sourceforge.net/projects/cs-prolog/'
license=(LGPL-3.0-or-later)
depends=(mono)
options=(!strip)
source=(https://downloads.sourceforge.net/project/cs-prolog/C%23Prolog4.1.zip)
sha256sums=('a3c102cfb51a032c7e218c8607aeace5211421971a466547a104ccc13851b2bd')

package() {
    cd 'C#Prolog SF4.1'
    mkdir -p -- "$pkgdir/opt/$pkgname"
    mv -- * "$pkgdir/opt/$pkgname"
}

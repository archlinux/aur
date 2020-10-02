# Maintainer: amtoaer <amtoaer@outlook.com>
pkgname=iwsp-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="Northeastern University Gymnasium Reservation."
arch=('x86_64')
url="https://github.com/amtoaer/iwsp"
license=('MIT')

source=(
        "iwsp-linux::https://github.com/amtoaer/iwsp/releases/download/${pkgver}/iwsp-linux"
        "LICENSE::https://raw.githubusercontent.com/amtoaer/iwsp/master/LICENSE"
)

md5sums=(
        '20eb5bb6ae8c73a7df78db641c2394d7'
        '31fad0aacc583d621612630ce8f5a26c'
)

package(){
        install -D -m 755 $srcdir/iwsp-linux $pkgdir/usr/bin/iwsp
        install -D -m 644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

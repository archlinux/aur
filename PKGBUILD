# Maintainer: amtoaer <amtoaer@outlook.com>
pkgname=iwsp-bin
pkgver=1.0.0
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
        '83b33c2f1fe52182de9777d751cf803e'
        '31fad0aacc583d621612630ce8f5a26c'
)

package(){
        install -D -m 755 /iwsp-linux /usr/bin/iwsp
        install -D -m 644 /LICENSE /usr/share/licenses/iwsp/LICENSE
}

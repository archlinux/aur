pkgname=viewery
pkgver=1.0
pkgrel=1
pkgdesc="Lightweight terminal system information tool"
arch=('any')
url="https://github.com/AlMonDdevV/ViewerY"
license=('MIT')
depends=('python' 'python-psutil')
source=("git+https://github.com/AlMonDdevV/ViewerY.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/ViewerY"
    install -Dm755 viewery.py "$pkgdir/usr/bin/viewery"
}

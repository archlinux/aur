pkgname=yodejs-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Fork of Node.js using GUI message loop"
arch=(
    x86_64
)
depends=(
)
makedepends=(
)
url='https://libyue.com/'
license=('Custom')
source=("https://github.com/yue/yode/releases/download/v$pkgver/yode-v$pkgver-linux-x64.zip")
sha256sums=('b2d5b8e37cb6ee10b5f78e3358d654350b799c9600a8901f09b49f3e22b41e92')

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/yode" "$pkgdir/usr/bin/yode"
}

pkgname=yodejs-bin
pkgver=0.11.0
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
sha256sums=('c4e07984a04ee3b0dc5af7df70f9eb4574bf4aa44b685de1d5b5883d233515da')

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/yode" "$pkgdir/usr/bin/yode"
}

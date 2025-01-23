# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=csync-release
pkgver=0.5.0
pkgrel=1
pkgdesc="Share your clipboard between different devices"
arch=('x86_64')
url="https://github.com/fioncat/csync"
license=('MIT')

source=("$pkgname-$pkgver::https://github.com/fioncat/csync/releases/download/v${pkgver}/csync-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('3dcf7817dd8fbdf116cb7cd90b3bc78c682052cc9d8c964aeaa3f11166232f5c')

options=('!strip' '!debug')

package() {
    install -Dm755 "csync" "$pkgdir/usr/bin/csync"
}

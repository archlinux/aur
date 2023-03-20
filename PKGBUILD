pkgname=qodejs-bin
pkgver=18.12.1
pkgrel=1
pkgdesc="Lightly modified fork of Node.js that allows injecting a third party event loop alongside Node's event loop"
arch=(
    x86_64
)
depends=(
)
makedepends=(
)
url='https://nodegui.org/'
license=('Custom')
source=("https://github.com/nodegui/qodejs/releases/download/v$pkgver-qode/v$pkgver-qode-linux-x64.tar.gz")
sha256sums=('9d77da927b9393ae44d2dab19726a847ae5dc5f57bf07faeee4443a723e57599')

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/qode" "$pkgdir/usr/bin/qode"
}

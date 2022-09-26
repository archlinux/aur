pkgname=qodejs-bin
pkgver=16.4.3
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
sha256sums=('92099e1f221942bb40cc24e2faec4cc8e9e50078b0ca9144d79a2bddb6ef7f16')

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/qode" "$pkgdir/usr/bin/qode"
}

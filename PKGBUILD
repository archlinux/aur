# Maintainer: Pavel Finkelshteyn <pavel.finkelshtein+AUR@gmail.com>

pkgname=ultralist
pkgdesc='Simple task management for tech folks.'
pkgver=1.2
pkgrel=2
url='https://ultralist.io/'
arch=('i686' 'x86_64' 'aarch64')
license=('MIT')
makedepends=()
depends=()
_source_prefix="https://github.com/ultralist/ultralist/releases/download/$pkgver/ultralistlinux_"
source=("LICENSE::https://raw.githubusercontent.com/ultralist/ultralist/master/LICENSE.md")
sha256sums=("11d9f7debc85882dbabbba5b0a74261010e3be35bf628e3aa841863c95d6c6f1")
source_x86_64=("ultralist_$pkgver.tar.gz::${_source_prefix}amd64.tar.gz")
sha256sums_x86_64=("10e145ed1eec544474d5b29c1ca682d1c477fcf0c62d15aa5f65656ab3b2b40d")
source_aarch64=("ultralist_$pkgver.tar.gz::${_source_prefix}arm64.tar.gz")
sha256sums_aarch64=("ca06fc9a84fe2bb4fc5d253d1d06114d721e2b9259effc5b4e6bc7cd6c6fe541")
source_i686=("ultralist_$pkgver.tar.gz::${_source_prefix}386.tar.gz")
sha256sums_i686=("6cbc1131f96ad9cc819a6fe5b97dd2907bb607aebe53b53bf58c9479645a0f44")

package(){
    install -Dm755 "$srcdir/ultralist" "$pkgdir/usr/bin/ultralist"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

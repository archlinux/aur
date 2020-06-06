# Maintainer: Pavel Finkelshteyn <pavel.finkelshtein+AUR@gmail.com>

pkgname=ultralist
pkgdesc='Simple task management for tech folks.'
pkgver=0.9.6
pkgrel=1
url='https://ultralist.io/'
arch=('i686' 'x86_64' 'aarch64')
license=('MIT')
makedepends=()
depends=()
_source_prefix="https://github.com/ultralist/ultralist/releases/download/$pkgver/ultralistlinux_"
source=("LICENSE::https://raw.githubusercontent.com/ultralist/ultralist/master/LICENSE.md")
sha256sums=("11d9f7debc85882dbabbba5b0a74261010e3be35bf628e3aa841863c95d6c6f1")
source_x86_64=("ultralist.tar.gz::${_source_prefix}amd64.tar.gz")
sha256sums_x86_64=('cd9a44c49c6fe03943659c1541eb0070c1fe826223cc9b0e5cb4d5aae7adeb24')
source_aarch64=("ultralist.tar.gz::${_source_prefix}arm.tar.gz")
sha256sums_aarch64=("d905ccfe1c0b9ec7b5545a3167966890a26d8876b60a0b1a3c8535fdd94ff664")
source_i686=("ultralist.tar.gz::${_source_prefix}386.tar.gz")
sha256sums_i686=("54a0d6cd8b682d095a39a65d258e06792eda5bd1acff71b2d88d3c26a286f324")

package(){
    install -Dm755 "$srcdir/ultralist" "$pkgdir/usr/bin/ultralist"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

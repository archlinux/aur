# Maintainer: Pavel Finkelshteyn <pavel.finkelshtein+AUR@gmail.com>

pkgname=ultralist
_gitname=cozy
pkgdesc='Simple task management for tech folks.'
pkgver=0.9.4
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
sha256sums_x86_64=('ea9ecb56cddfd5c055ca1f29b7c08a1a2d1e2abf7f23c6abe8bdad0d2ac100fd')
source_aarch64=("ultralist.tar.gz::${_source_prefix}arm.tar.gz")
sha256sums_aarch64=("3cc8c05b11e82479ed23c24cfa64a2bc096f6f5a03ffddff885d7282559d8c77")
source_i686=("ultralist.tar.gz::${_source_prefix}386.tar.gz")
sha256sums_i686=("e12c444316b702464a40b4ede6f43c8c9a96dcfb20d8a2bf645476fa78b04376")

package(){
    install -Dm755 "$srcdir/ultralist" "$pkgdir/usr/bin/ultralist"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

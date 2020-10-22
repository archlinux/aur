# Maintainer: Pavel Finkelshteyn <pavel.finkelshtein+AUR@gmail.com>

pkgname=ultralist
pkgdesc='Simple task management for tech folks.'
pkgver=1.6.1
pkgrel=1
url='https://ultralist.io/'
arch=('i686' 'x86_64' 'aarch64')
license=('MIT')
makedepends=()
depends=()
_source_prefix="https://github.com/ultralist/ultralist/releases/download/$pkgver/ultralistlinux_"
source=("LICENSE::https://raw.githubusercontent.com/ultralist/ultralist/master/LICENSE.md")
sha256sums=("11d9f7debc85882dbabbba5b0a74261010e3be35bf628e3aa841863c95d6c6f1")
source_x86_64=("ultralist_$pkgver.tar.gz::${_source_prefix}amd64.tar.gz")
sha256sums_x86_64=("9dc3c8fa5a73ea7f1b6b9377e57f1fc554a2f021add2e428839c3f15587fd67c")
source_aarch64=("ultralist_$pkgver.tar.gz::${_source_prefix}arm64.tar.gz")
sha256sums_aarch64=("e175dfaefbcc586cea53207870f0d125cd495476d78cbedcadecf4c85446e518")
source_i686=("ultralist_$pkgver.tar.gz::${_source_prefix}386.tar.gz")
sha256sums_i686=("c3acaecd13edf1dd5b07a18c10a82be468082b3fce933cb2e40efe396d991835")

package(){
    install -Dm755 "$srcdir/ultralist" "$pkgdir/usr/bin/ultralist"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

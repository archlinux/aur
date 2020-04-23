# Maintainer: Pavel Finkelshteyn <pavel.finkelshtein+AUR@gmail.com>

pkgname=ultralist
pkgdesc='Simple task management for tech folks.'
pkgver=0.9.5
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
sha256sums_x86_64=('5014fb19ac352e1e74387175bbf150b58c0d002b3c0b3878a4e75d5103fc39f4')
source_aarch64=("ultralist.tar.gz::${_source_prefix}arm.tar.gz")
sha256sums_aarch64=("201e8062d5604ea1cba17f036b07ad34678fe8f531fab6ae4bc3fa0feb3c1bd5")
source_i686=("ultralist.tar.gz::${_source_prefix}386.tar.gz")
sha256sums_i686=("8448d0f1ef431aff04aa60f9eda3f74321d445457db099cd0aa7bb9daec8203d")

package(){
    install -Dm755 "$srcdir/ultralist" "$pkgdir/usr/bin/ultralist"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Pavel Finkelshteyn <pavel.finkelshtein+AUR@gmail.com>

pkgname=ultralist
pkgdesc='Simple task management for tech folks.'
pkgver=1.0
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
sha256sums_x86_64=("b5d3c464c9e8dc4afbdc19ec793c3c7590a26e11a4618a943c77a0570fb67871")
source_aarch64=("ultralist_$pkgver.tar.gz::${_source_prefix}arm.tar.gz")
sha256sums_aarch64=("68450eb53c7cb21391cbf8e13d52681874774fe7bbb86c569fe13e4bc2196ac4")
source_i686=("ultralist_$pkgver.tar.gz::${_source_prefix}386.tar.gz")
sha256sums_i686=("bb229a42b994170fd8fca4166f76652d64a88c8f31b822b3d657ffe597805425")

package(){
    install -Dm755 "$srcdir/ultralist" "$pkgdir/usr/bin/ultralist"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

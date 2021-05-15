# Maintainer: Pasha Finkelshteyn <pavel.finkelshtein+AUR@gmail.com>

pkgname=ultralist
pkgdesc='Simple task management for tech folks.'
pkgver=1.7.0
pkgrel=2
url='https://ultralist.io/'
arch=('i686' 'x86_64' 'aarch64')
license=('MIT')
makedepends=()
depends=()
_source_prefix="https://github.com/ultralist/ultralist/releases/download/$pkgver/ultralistlinux_"
source=("LICENSE::https://raw.githubusercontent.com/ultralist/ultralist/master/LICENSE.md")
source_aarch64=("ultralist_$pkgver-arm64.tar.gz::${_source_prefix}arm64.tar.gz")
source_i686=("ultralist_$pkgver-i386.tar.gz::${_source_prefix}386.tar.gz")
source_x86_64=("ultralist_$pkgver-adm64.tar.gz::${_source_prefix}amd64.tar.gz")
sha256sums=('11d9f7debc85882dbabbba5b0a74261010e3be35bf628e3aa841863c95d6c6f1')
sha256sums_i686=('0b09cc3ab7115708bac9ba56aee11b3e6eed65b4e8991a6a650aa318c2596039')
sha256sums_x86_64=('73690d537adc0836797c1fb1cc8c661f1c2b8a12e0a56a79630a51a91fb7c281')
sha256sums_aarch64=('2f62da19ab925e0528f2a9c524c4f4ec98ad87403e8fafb33910d764e1d442b8')


package(){
    install -Dm755 "$srcdir/ultralist" "$pkgdir/usr/bin/ultralist"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

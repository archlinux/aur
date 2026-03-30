# Maintainer: hnchengzong
pkgname=hn-rename-python-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="一个极简的使用python写的批量重命名工具"
arch=('any')
url="https://github.com/hnchengzong/hn-rename-python"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver-$pkgrel.pkg.tar.zst::https://github.com/hnchengzong/hn-rename-python/releases/download/v$pkgver/hn-rename-python-$pkgver-$pkgrel.pkg.tar.zst")
sha256sums=('ec1ba6569ec7547d32ed7f3b5fd5b1334f9398a9d51edbf27eedcd7cc8e8e5f6')

package() {
    cd "$srcdir"
    bsdtar -xf "$pkgname-$pkgver-$pkgrel.pkg.tar.zst" -C "$pkgdir" --exclude='.PKGINFO' --exclude='.BUILDINFO' --exclude='.MTREE'
}

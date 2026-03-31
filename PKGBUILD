# Maintainer: hnchengzong
pkgname=hn-rename-python-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="一个极简的使用python写的批量重命名工具"
arch=('any')
url="https://github.com/hnchengzong/hn-rename-python"
license=('MIT')
depends=('python')
source=("https://github.com/hnchengzong/hn-rename-python/releases/download/v$pkgver/hn-rename-python-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('869b83837adf3964c3a0fa95d31b1c82915185d0827cabcc5affb6d7d1cbc8a9')
package() {
    bsdtar -xf "$srcdir/hn-rename-python-$pkgver-$pkgrel-any.pkg.tar.zst" -C "$pkgdir" --exclude='.PKGINFO' --exclude='.BUILDINFO' --exclude='.MTREE'
}

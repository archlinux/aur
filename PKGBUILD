# Maintainer: hnchengzong
pkgname=hn-rename-python-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="一个极简的使用python写的批量重命名工具"
arch=('any')
url="https://github.com/hnchengzong/hn-rename-python"
license=('MIT')
depends=('python')
source=("https://github.com/hnchengzong/hn-rename-python/releases/download/v$pkgver/hn-rename-python-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('1dc01e68a3329ca79d6288c92425a98d381b096f3597b5cafde6ab492fdfebd2')
package() {
    bsdtar -xf "$srcdir/hn-rename-python-$pkgver-$pkgrel-any.pkg.tar.zst" -C "$pkgdir" --exclude='.PKGINFO' --exclude='.BUILDINFO' --exclude='.MTREE'
}

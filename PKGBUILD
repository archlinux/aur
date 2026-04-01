# Maintainer: hnchengzong
pkgname=hn-rename-python-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="一个极简的使用python写的批量重命名工具"
arch=('any')
url="https://github.com/hnchengzong/hn-rename-python"
license=('MIT')
depends=('python' 'python-natsort')
source=("https://github.com/hnchengzong/hn-rename-python/releases/download/v$pkgver/hn-rename-python-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('e75d210290bc79fe82ee8f25b2bbb58021daa518fc9f8f5817e94406eb1633ba')
package() {
    bsdtar -xf "$srcdir/hn-rename-python-$pkgver-$pkgrel-any.pkg.tar.zst" -C "$pkgdir" --exclude='.PKGINFO' --exclude='.BUILDINFO' --exclude='.MTREE'
}

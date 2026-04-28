# Maintainer: hnchengzong
pkgname=hn-rename-python-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="一个极简的使用python写的批量重命名工具"
arch=('any')
url="https://github.com/hnchengzong/hn-rename-python"
license=('MIT')
depends=('python' 'python-natsort')
source=("https://github.com/hnchengzong/hn-rename-python/releases/download/v$pkgver/hn-rename-python-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('da1b2c11f637a6355215ce0a0fc1a6292053e29c36e202d01b38e533926f3dc2')
package() {
    bsdtar -xf "$srcdir/hn-rename-python-$pkgver-$pkgrel-any.pkg.tar.zst" -C "$pkgdir" --exclude='.PKGINFO' --exclude='.BUILDINFO' --exclude='.MTREE'
}

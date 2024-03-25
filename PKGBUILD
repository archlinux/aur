# Maintainer: Sergio Losito <shape93@gmail.com>
pkgname=upt-bin
pkgbase=upt-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Universal Package-management Tool for any OS."
arch=('x86_64' 'aarch64')
url="https://github.com/sigoden/upt"
license=('MIT' 'Apache')
depends=('curl' 'tar' 'gzip' 'unzip')

source_x86_64=("upt-v$pkgver-x86_64-unknown-linux-musl.tar.gz"::"https://github.com/sigoden/upt/releases/download/v$pkgver/upt-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('0f6622042255dbdbd57f850d2e5e05eed6bd1bd3ac18aef57f94d9677c09728d')

source_aarch64=("upt-v$pkgver-aarch64-unknown-linux-musl.tar.gz"::"https://github.com/sigoden/upt/releases/download/v$pkgver/upt-v$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums_aarch64=('5e216ec000d374a49c273f5902b6d7fb67bbbcbd9ce4512191b87be33bfbded8')

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m 755 upt "$pkgdir/usr/bin/upt"
}

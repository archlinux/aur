# Maintainer: PJ568 <xidong-ai@foxmail.com>
pkgname=xidong-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Lightweight CLI agent whose only tool is the shell'
arch=('x86_64')
url='https://github.com/Xidong-AI/xidong'
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'zlib' 'brotli' 'zstd')
provides=('xidong')
conflicts=('xidong')
source=("xidong-$pkgver-x86_64::https://github.com/Xidong-AI/xidong/releases/download/v$pkgver/xidong-x86_64-unknown-linux-gnu")
sha256sums=('4bebb8f280f8609769577acc8c1020881accfc3da7fb1717449cae0dc1ceee6d')

package() {
  install -Dm755 "$srcdir/xidong-$pkgver-x86_64" "$pkgdir/usr/bin/xidong"
}

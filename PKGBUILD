# Maintainer: PJ568 <xidong-ai@foxmail.com>
pkgname=yaa-bin
pkgver=2.13.1
pkgrel=1
pkgdesc='Yet Another Agent: analyze and execute natural-language tasks (prebuilt)'
arch=('x86_64')
url='https://github.com/byte-tea/yaa'
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'zlib' 'brotli' 'zstd')
provides=('yaa')
conflicts=('yaa')
source=("yaa-$pkgver-x86_64.zip::https://github.com/byte-tea/yaa/releases/download/v$pkgver/yaa_server_ubuntu-latest.zip.zip")
sha256sums=('9dbf462d8e12e7fec8b6a59c4dded489297e231cef17b18ea03cb91a1dd9e026')

package() {
  install -Dm755 "$srcdir/yaa" "$pkgdir/usr/bin/yaa"
}

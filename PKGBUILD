# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Co-Maintainer: p0ryae <porya at contact dot me>

pkgname=lazap-bin
pkgver=0.10.0
pkgrel=2
pkgdesc="A native-like attempt to unify your clients with a fast, modern, and cross-platform solution"
url="https://github.com/Lazap-Development/Lazap"
license=('GPL-3.0-only')
arch=('x86_64')
depends=('brotli' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libidn2' 'libnghttp2'
         'libpsl' 'libunistring' 'libx11' 'openssl' 'zlib' 'zstd')
provides=("lazap")
conflicts=("lazap")
source=("$url/releases/download/v$pkgver/Lazap-$pkgver-x86_64.rpm")
sha256sums=('6bbd76cab0614cb0f44cfd60c3e960033f30921be5a541a52f8e67b047d8308b')

package() {
  rm -dr usr/lib
  mv usr "$pkgdir/usr"
}

# PKGBUILD

pkgname=upt-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Universal Package-management Tool for any OS."
arch=('x86_64' 'aarch64')
url="https://github.com/sigoden/upt"
license=('MIT' 'Apache')
depends=('curl' 'tar' 'gzip' 'unzip')

source_x86_64=("upt-v$pkgver-x86_64-unknown-linux-musl.tar.gz"::"https://github.com/sigoden/upt/releases/download/v$pkgver/upt-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('1781b7952520a0374478dc1de818945537a3852cb8b340b4adfb7c8c1da0c601')

source_aarch64=("upt-v$pkgver-aarch64-unknown-linux-musl.tar.gz"::"https://github.com/sigoden/upt/releases/download/v$pkgver/upt-v$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums_aarch64=('827f040206d0255bac4dfd356b310bb74a1409d45e6833de67e6e1bfd208cb84')

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m 755 upt "$pkgdir/usr/bin/upt"
}

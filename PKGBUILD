# Maintainer: A. Benz <hello@benz.dev>
pkgname=bmv-bin
license=('MIT')
pkgver=0.0.10
pkgrel=1
pkgdesc='drop-in mv replacement with bulk moving support'
url='https://github.com/abenz1267/bmv'
source_x86_64=("https://github.com/abenz1267/bmv/releases/download/v$pkgver/bmv_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/abenz1267/bmv/releases/download/v$pkgver/bmv_Linux_arm64.tar.gz")
arch=('x86_64' 'aarch64')
conflicts=('bmv')
provides=('bmv')
sha256sums_x86_64=('f54cb0abd79a00eaaa9a1d6242d87f34f5224469bbbe743d5b52b9c5fe749cf3')
sha256sums_aarch64=('7547af5c44053af3fa5e6068386e64485de1e9c84d6a6a61f6a9592e8e94856f')

package() {
  cd "$srcdir/"

  install -Dm755 bmv "${pkgdir}/usr/bin/bmv"
}

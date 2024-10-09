# Maintainer: Sergio Losito <shape93@gmail.com>
pkgname=upt-bin
pkgbase=upt-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Universal Package-management Tool for any OS."
arch=('x86_64' 'aarch64')
url="https://github.com/sigoden/upt"
license=('MIT' 'Apache')
depends=('curl' 'tar' 'gzip' 'unzip')

source_x86_64=("upt-v$pkgver-x86_64-unknown-linux-musl.tar.gz"::"https://github.com/sigoden/upt/releases/download/v$pkgver/upt-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('69851925723b519ec86d710cc788ba66f20df2d163e376896695f1991217c263')

source_aarch64=("upt-v$pkgver-aarch64-unknown-linux-musl.tar.gz"::"https://github.com/sigoden/upt/releases/download/v$pkgver/upt-v$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums_aarch64=('db288935c4e55d6d8dc7f84ff2072a5f1366189346694e02d6df8aac3f54648b')

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m 755 upt "$pkgdir/usr/bin/upt"
}

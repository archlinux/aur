# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini@gmail.com>

pkgname=upt-bin
pkgbase=upt-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Universal Package-management Tool for any OS."
arch=('x86_64' 'aarch64')
url="https://github.com/sigoden/upt"
license=('MIT' 'Apache')
depends=('curl' 'tar' 'gzip' 'unzip')

source_x86_64=("upt-v$pkgver-x86_64-unknown-linux-musl.tar.gz"::"https://github.com/sigoden/upt/releases/download/v$pkgver/upt-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('3051a30e23a2c5167bdd48d98fea2bf8fedec328bf2f570b3c4d42fdb92a674e')
sha256sums_aarch64=('bd1092508fdcc2b8cff42b60575fd9c2862786f91fbb75828c6781980022062e')

source_aarch64=("upt-v$pkgver-aarch64-unknown-linux-musl.tar.gz"::"https://github.com/sigoden/upt/releases/download/v$pkgver/upt-v$pkgver-aarch64-unknown-linux-musl.tar.gz")

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m 755 upt "$pkgdir/usr/bin/upt"
}

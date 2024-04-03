# shellcheck shell=bash disable=SC2034,SC2154
pkgname=neocmakelsp-bin
pkgver=0.6.22
pkgrel=1
pkgdesc="another cmake lsp"
arch=(x86_64)
url=https://github.com/Decodetalkers/neocmakelsp
license=(GPL3)
source=("$url/releases/download/v$pkgver/neocmakelsp-$(uname -m)-unknown-${OSTYPE:-linux-gnu}")
sha256sums=('5aa92c283c3f8c71b6bbf451b9d6c298839002197395853133e4e035cdd3c817')

package() {
  install -D "neocmakelsp-$(uname -m)-unknown-${OSTYPE:-linux-gnu}" $pkgdir/usr/bin/neocmakelsp
}

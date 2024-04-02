# shellcheck shell=bash disable=SC2034,SC2154
pkgname=neocmakelsp-bin
pkgver=0.6.20
pkgrel=1
pkgdesc="another cmake lsp"
arch=(x86_64)
url=https://github.com/Decodetalkers/neocmakelsp
license=(GPL3)
source=("$url/releases/download/v$pkgver/neocmakelsp-$(uname -m)-unknown-${OSTYPE:-linux-gnu}")
sha256sums=('98cfc7062097059b4e2d08ef542d545e1c7951a4fc54fb2b9c14bf185007bda0')

package() {
  install -D "neocmakelsp-$(uname -m)-unknown-${OSTYPE:-linux-gnu}" $pkgdir/usr/bin/neocmakelsp
}

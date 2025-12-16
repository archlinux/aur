# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu, Zhenyu <wuzhenyu@ustc.edu>
_pkgname=jinja-lsp
pkgname=$_pkgname-bin
pkgver=0.1.90
pkgrel=1
pkgdesc="Language Server for jinja"
arch=(x86_64)
url=https://github.com/uros-5/jinja-lsp
license=(MIT)
makedepends=(cargo)
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("https://github.com/uros-5/jinja-lsp/releases/download/v$pkgver/jinja-lsp.zip")
sha256sums=('b69ca4ffbf4d3614231bd01b95c79050c71c350efdf43d8ad92d9cd02862b97e')

package() {
	install -D jinja-lsp-linux-x64 "$pkgdir/usr/bin/jinja-lsp"
}

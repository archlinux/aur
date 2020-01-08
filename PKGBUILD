# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=jsonnet-bundler-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="jsonnet package manager"
arch=('x86_64')
url="https://github.com/jsonnet-bundler/jsonnet-bundler"
license=('Apache')
source=("https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v${pkgver}/jb-linux-amd64")
sha256sums=('3e4db592c3f93838ad03c36aa9700106789ed65ca94f533ad1612a0ad9d807af')

package() {
  install -Dm 755 "$srcdir/jb-linux-amd64" "$pkgdir/usr/bin/jb"
}

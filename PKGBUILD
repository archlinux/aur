# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=jsonnet-bundler-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="jsonnet package manager"
arch=('x86_64')
url="https://github.com/jsonnet-bundler/jsonnet-bundler"
license=('Apache')
source=("https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v${pkgver}/jb-linux-amd64")
sha256sums=('700a311803565f06f61d03449cc28dc320df8853b491124c1f25a6543e0c79c9')

package() {
  install -Dm 755 "$srcdir/jb-linux-amd64" "$pkgdir/usr/bin/jb"
}

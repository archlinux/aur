# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=k0sctl-bin
pkgver=0.12.3
pkgrel=1
pkgdesc="A bootstrapping and management tool for k0s clusters."
arch=('x86_64')
url="https://github.com/k0sproject/k0sctl"
license=('Apache')
source=("k0sctl-linux-x64-$pkgver::https://github.com/k0sproject/k0sctl/releases/download/v${pkgver}/k0sctl-linux-x64")
sha256sums=('04ca7471f2ad803cd16c9e93fa94982cb3530d719233fa5d3baf5b38fa9211fb')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/k0sctl-linux-x64-$pkgver" "$pkgdir/usr/bin/k0sctl"
}

# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=k0sctl-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="A bootstrapping and management tool for k0s clusters."
arch=('x86_64')
url="https://github.com/k0sproject/k0sctl"
license=('Apache')
source=("https://github.com/k0sproject/k0sctl/releases/download/v${pkgver}/k0sctl-linux-x64")
sha256sums=('581b1625f4bfa9918e0af74da7eaf8a109711315707438910d9153617cc63a3a')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/k0sctl-linux-x64" "$pkgdir/usr/bin/k0sctl"
}

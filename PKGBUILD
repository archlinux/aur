# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=kubepug-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="Kubernetes PreUpGrade (Checker)"
arch=('x86_64')
url="https://github.com/rikatz/kubepug"
license=('Apache')
source=("https://github.com/rikatz/kubepug/releases/download/v${pkgver}/kubepug_linux_amd64.tar.gz")
sha256sums=('9ca8970c77faa4fac11a6571862372debe7e87fc9e0b54053a3279fcb7e4ffe4')

package() {
  install -Dm 755 "$srcdir/kubepug" "$pkgdir/usr/bin/kubepug"
}

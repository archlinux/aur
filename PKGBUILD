# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=kubepug-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="Kubernetes PreUpGrade (Checker)"
arch=('x86_64')
url="https://github.com/rikatz/kubepug"
license=('Apache')
source=("https://github.com/rikatz/kubepug/releases/download/v${pkgver}/kubepug_linux_amd64.tar.gz")
sha256sums=('8343e018795c33c59535423a78d56d8bef5402453c6f9dcac5a6659ed701200a')

package() {
  install -Dm 755 "$srcdir/kubepug" "$pkgdir/usr/bin/kubepug"
}

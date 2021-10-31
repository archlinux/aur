# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=kubepug-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="Kubernetes PreUpGrade (Checker)"
arch=('x86_64')
url="https://github.com/rikatz/kubepug"
license=('Apache')
source=("https://github.com/rikatz/kubepug/releases/download/v${pkgver}/kubepug_linux_amd64.tar.gz")
sha256sums=('723694ab60a1a787f94b11860515e282fbd2cb7f53480bece9d7c880f0e4d532')

package() {
  install -Dm 755 "$srcdir/kubepug" "$pkgdir/usr/bin/kubepug"
}

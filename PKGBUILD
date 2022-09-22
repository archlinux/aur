# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=kubepug-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Kubernetes PreUpGrade (Checker)"
arch=('x86_64')
url="https://github.com/rikatz/kubepug"
license=('Apache')
source=("https://github.com/rikatz/kubepug/releases/download/v${pkgver}/kubepug_linux_amd64.tar.gz")
sha256sums=('7659087006c51318854a75469433d4e8d09aa40eec3828dd57ef5d0a4e7489a6')

package() {
  install -Dm 755 "$srcdir/kubepug" "$pkgdir/usr/bin/kubepug"
}

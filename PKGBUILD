# Maintainer: Ethan Nguyen <etnguyen03+aur at hotmail dot com>
pkgname=skeema-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="Declarative pure-SQL schema management for MySQL and MariaDB"
arch=('x86_64')
url="https://www.skeema.io/"
license=('Apache')
source=("https://github.com/skeema/skeema/releases/download/v${pkgver}/skeema_amd64.deb")
sha256sums=("1c2ccac47345a63ab1f02d14cdfcffbb0211a0429ab8bc06a099f970d5efa37c")
prepare() {
    tar -xf data.tar.gz
}
package() {
    cp --parents -a usr/bin "$pkgdir"
}

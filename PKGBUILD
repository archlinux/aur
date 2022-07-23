# Maintainer: Ethan Nguyen <etnguyen03+aur at hotmail dot com>
pkgname=skeema-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Declarative pure-SQL schema management for MySQL and MariaDB"
arch=('x86_64')
url="https://www.skeema.io/"
license=('Apache')
source=("https://github.com/skeema/skeema/releases/download/v${pkgver}/skeema_amd64.deb")
sha256sums=("0f8e1d89688f571ce8336310945c4aa68ecdd23d2efe7d25fb93f69b14709e02")
prepare() {
    tar -xf data.tar.gz
}
package() {
    cp --parents -a usr/bin "$pkgdir"
}

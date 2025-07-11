# Maintainer: Ethan Nguyen <etnguyen03+aur at hotmail dot com>
pkgname=skeema-bin
pkgver=1.12.3
pkgrel=1
pkgdesc="Declarative pure-SQL schema management for MySQL and MariaDB"
arch=('x86_64')
url="https://www.skeema.io/"
license=('Apache')
source=("https://github.com/skeema/skeema/releases/download/v${pkgver}/skeema_amd64.deb")
sha256sums=("51cfd52b0b0ac3f950bc7f13edf99232e6efbee9b01c110f5daa4ad91ef3c093")
prepare() {
    tar -xf data.tar.gz
}
package() {
    cp --parents -a usr/bin "$pkgdir"
}

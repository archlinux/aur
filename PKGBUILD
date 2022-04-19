# Maintainer: Ethan Nguyen <etnguyen03+aur at hotmail dot com>
pkgname=skeema-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="Declarative pure-SQL schema management for MySQL and MariaDB"
arch=('x86_64')
url="https://www.skeema.io/"
license=('Apache')
source=("https://github.com/skeema/skeema/releases/download/v${pkgver}/skeema_amd64.deb")
sha256sums=("c339612730ebb8a49d8ff93ed98fd92eadf677d92b7b680fd7433f8206411a48")
prepare() {
    tar -xf data.tar.gz
}
package() {
    cp --parents -a usr/bin "$pkgdir"
}

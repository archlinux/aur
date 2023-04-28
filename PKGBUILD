# Maintainer: Ethan Nguyen <etnguyen03+aur at hotmail dot com>
pkgname=skeema-bin
pkgver=1.10.0
pkgrel=1
pkgdesc="Declarative pure-SQL schema management for MySQL and MariaDB"
arch=('x86_64')
url="https://www.skeema.io/"
license=('Apache')
source=("https://github.com/skeema/skeema/releases/download/v${pkgver}/skeema_amd64.deb")
sha256sums=("b8f71ef131ddf83deeb23b76c77bf7fe7468e196b252c457ed094fe98b162fbe")
prepare() {
    tar -xf data.tar.gz
}
package() {
    cp --parents -a usr/bin "$pkgdir"
}

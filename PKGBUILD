# Maintainer: Den Ivanov <securityxiii@gmail.com>
_pkgname=windscribe
pkgname=$_pkgname-openrc
pkgver=r1
pkgrel=1
pkgdesc="OpenRC service scripts for $_pkgname"
url="https://aur.archlinux.org/packages/$pkgname"
arch=(any)
license=(GPL)
depends=(openrc $_pkgname-cli)
source=($_pkgname)
sha256sums=('ff0deb5d75b9a59c60786033d3d256b7adc800d5a23040e1f2df021158be3841')

package() {
    cd "$srcdir"
    install -Dm755 $_pkgname "$pkgdir/etc/init.d/windscribe"
}

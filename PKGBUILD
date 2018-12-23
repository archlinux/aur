# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=smdev-openrc
pkgver=20181222
pkgrel=1
pkgdesc="OpenRC smdev startup script"
arch=('any')
license=('MIT/X')
depends=('smdev' 'openrc')
source=("smdev")
sha256sums=('9d979138e078af142884272722e1c4c629bdde79821f2e34fc10fe8902f5cc51')

package() {
    install -Dm755 ${srcdir}/smdev ${pkgdir}/etc/init.d/smdev
}

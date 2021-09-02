# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=smdev-openrc
pkgver=20181222
pkgrel=2
pkgdesc="OpenRC smdev startup script"
arch=('any')
license=('MIT/X')
depends=('smdev' 'openrc')
source=("smdev")
sha256sums=('69fae91eca14f0c683d45683c647cea6ee2994131526cee07f7cedca48277741')

package() {
    install -Dm755 ${srcdir}/smdev ${pkgdir}/etc/init.d/smdev
}

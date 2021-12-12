# Maintainer: voj343 <voj343@yandex.com>
pkgname=expressvpn-openrc
pkgver=1.0
pkgrel=1
pkgdesc="expressvpn openrc service"
arch=('any')
url='https://github.com/voj343/expressvpn-openrc'
license=('GPL')
depends=('expressvpn' 'openrc')
source=("expressvpnd.initd")
sha256sums=("32b3d89693cddd205c477f18af656ce55edf359281b7e9561ca7e74afdd3df00")

package() {
  install -Dm755 ${srcdir}/expressvpnd.initd "$pkgdir"/etc/init.d/expressvpnd
  install=expressvpnd.install
}

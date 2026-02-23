# Maintainer: ticnoo <ticnoomail@gmail.com>
pkgname=expressvpn-waybar-bin
pkgver=0.1
pkgrel=2
pkgdesc="A Waybar custom module to monitor and toggle ExpressVPN"
arch=('x86_64')
url="https://github.com/ticnoo/expressvpn-waybar"
license=('MIT')
depends=('expressvpn>=5.0.0')
provides=('expressvpn-waybar')
conflicts=('expressvpn-waybar')
source=("expressvpn-waybar-${pkgver}::https://github.com/ticnoo/expressvpn-waybar/releases/download/${pkgver}/expressvpn-waybar")
sha256sums=('99440573225d1e48448464e1f655dd572eb0d23fe3f5d143e98031e31edaa041')

package() {
    install -Dm755 "${srcdir}/expressvpn-waybar-${pkgver}" "${pkgdir}/usr/bin/expressvpn-waybar"
}

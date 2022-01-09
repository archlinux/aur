# Maintainer: LGiki <lgiki at lgiki dot net>
pkgname=gnome-shell-extension-simple-system-monitor
pkgver=4
pkgrel=1
pkgdesc="Show current CPU usage, memory usage and net speed on panel."
arch=('any')
url="https://github.com/LGiki/gnome-shell-extension-simple-system-monitor"
license=('GPL')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('5c3a8a957a11b7a73b8639fb4a8cb33fab23b25f36792af906765f2532d1a0936f71bdd354cb0ab30524e9355b396b1ab03089ae5dd7a7b5df3dbe89ead7e8b2')

package() {
    _uuid="ssm-gnome@lgiki.net"

    install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -a src/* "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}
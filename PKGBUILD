# Maintainer: LGiki <lgiki at lgiki dot net>
pkgname=gnome-shell-extension-simple-system-monitor
pkgver=12
pkgrel=1
pkgdesc="Show current CPU usage, memory usage and net speed on panel."
arch=('any')
url="https://github.com/LGiki/gnome-shell-extension-simple-system-monitor"
license=('GPL')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('d3cf9eee197242d7128721553fce5671d7e3f601d735664e0d24d73dd67d069f1581e0d8e6526b62132cdfb4de1e6f1e2a5f4a03c1d1cf373a5c8e9acbb857fd')

package() {
    _uuid="ssm-gnome@lgiki.net"

    install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -a src/* "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}
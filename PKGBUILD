# Maintainer: LGiki <lgiki at lgiki dot net>
pkgname=gnome-shell-extension-simple-system-monitor
pkgver=1
pkgrel=1
pkgdesc="Show current CPU usage, memory usage and net speed on panel."
arch=('any')
url="https://github.com/LGiki/gnome-shell-extension-simple-system-monitor"
license=('GPL')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('4e7ccf5f7b509cc2393ff5dd71a4993fab060c18f56fa237335cd2c1402cd90cedba6467def46bf6920718170b0a6f47ff538459a4af5d247125a39d8ff071c9')

package() {
    _uuid="ssm-gnome@lgiki.net"

    install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -a src/* "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}
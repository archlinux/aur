# Maintainer: LGiki <lgiki at lgiki dot net>
pkgname=gnome-shell-extension-simple-system-monitor
pkgver=10
pkgrel=1
pkgdesc="Show current CPU usage, memory usage and net speed on panel."
arch=('any')
url="https://github.com/LGiki/gnome-shell-extension-simple-system-monitor"
license=('GPL')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('2ec7458a1e7914e01f946db6d6a272815ce62da792689cf8804ae11ff6b41dbc1443e6c3327fa4aab4fb2336d919e9ab3fefbd9d53420da92915eb93c5cc25cc')

package() {
    _uuid="ssm-gnome@lgiki.net"

    install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -a src/* "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}
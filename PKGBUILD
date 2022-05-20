# Maintainer: LGiki <lgiki at lgiki dot net>
pkgname=gnome-shell-extension-simple-system-monitor
pkgver=8
pkgrel=1
pkgdesc="Show current CPU usage, memory usage and net speed on panel."
arch=('any')
url="https://github.com/LGiki/gnome-shell-extension-simple-system-monitor"
license=('GPL')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('2adf9897dd86b2e0dae069d527eb53418d7260c3a5a18bbebb43e5a8edd5d619088a287574825611c22d554f5ef12fa5ca0e935b50aab548e9ca449adaed5581')

package() {
    _uuid="ssm-gnome@lgiki.net"

    install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -a src/* "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}
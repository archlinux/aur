# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=nzbget-systemd
pkgver=0.1
pkgrel=2
pkgdesc="Systemd service and config for NZBGet"
url="https://github.com/Holzhaus/PKGBUILDs"
arch=('any')
depends=('nzbget')
license=('GPL')
source=('nzbget.service')
install='nzbget.install'
sha256sums=('c5dc750214105fe2ab4aff9545a48b7a5cfa246d00c771b1600ce4e6b74f70fb')
package() {
    cd "${srcdir}"

    install -d "${pkgdir}/usr/lib/systemd/system"
    install -m644 -t "${pkgdir}/usr/lib/systemd/system" nzbget.service

    install -d "${pkgdir}/var/lib/nzbget"
}

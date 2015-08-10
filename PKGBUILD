# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=nzbget-systemd
pkgver=0.1
pkgrel=3
pkgdesc="Systemd service for NZBGet"
url="https://github.com/Holzhaus/PKGBUILDs"
arch=('any')
depends=('nzbget')
license=('GPL')
source=('nzbget.service')
install='nzbget.install'
sha256sums=('3360adaa83a070995e7467cf5fd58518d836b2134ce19179364ac92db9e8bee0')
package() {
    cd "${srcdir}"

    install -d "${pkgdir}/usr/lib/systemd/system"
    install -m644 -t "${pkgdir}/usr/lib/systemd/system" nzbget.service

    install -d "${pkgdir}/var/lib/nzbget"
}

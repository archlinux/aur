# Maintainer: Jaime Martínez Rincón <jaime@jamezrin.name>

pkgname=sddm-raised
pkgver=1
pkgrel=1
pkgdesc="Simple script to constantly raise/focus SDDM window, to prevent other windows being shown over it"
arch=('i686' 'x86_64')
url="https://github.com/jamezrin/sddm-raised"
license=('MIT')
depends=('xdotool')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/${pkgname}/sddm-raised" "${pkgdir}/usr/local/bin/sddm-raised"
    install -Dm644 "${srcdir}/${pkgname}/sddm-raised.service" "${pkgdir}/etc/systemd/system/sddm-raised.service"
}


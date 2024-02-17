# Maintainer: xtex <xtexchooser @ duck . com>
pkgname=dinit-systemd
pkgver=2
pkgrel=1
pkgdesc='Systemd service files for dinit - Service monitoring / "init" system'
arch=(any)
license=('Apache')
depends=('dinit' 'systemd')
install='dinit-systemd.install'
source=("dinit.service"
        "dinit-user.service")
sha256sums=('b485f7c5a8ffb3665ad426e814eecb388dde9064835b100acdce15410f175639'
            '891c9f78140cbaf886299d0a1b08c2d6e456ae54dc9538f6fa178363af83c3e6')
package() {
    cd "${srcdir}"
    install -Dm644 "dinit.service" "${pkgdir}/usr/lib/systemd/system/dinit.service"
    install -Dm644 "dinit-user.service" "${pkgdir}/usr/lib/systemd/user/dinit.service"
}

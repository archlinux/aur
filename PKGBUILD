# Maintainer: realroot

pkgname=tinydm-dinit
pkgver=20230809
pkgrel=1
pkgdesc="dinit service scripts for tinydm"
arch=('any')
#url=""
license=('GPL-3')
groups=('dinit-world')
depends=('tinydm' 'init-logind')
provides=('init-tinydm' 'init-displaymanager')
conflicts=('init-tinydm' 'init-displaymanager')
source=("tinydm" "tinydm.script" "tinydm.conf")

package() {
    install -Dm644 tinydm        ${pkgdir}/etc/dinit.d/tinydm
    install -Dm755 tinydm.script ${pkgdir}/etc/dinit.d/scripts/tinydm
    install -Dm644 tinydm.conf   ${pkgdir}/etc/tinydm.conf
}

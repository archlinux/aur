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
sha256sums=('6c88c178c9a3eeeacb90b1d69beb31a42099d4dfa698998897d9d1e7dd0d30e5'
            '4a4b45e7d9ab6c17e63be98ffd835ecd9626eabe9c90f467743be5e6100e526d'
            '326afb1675b6ee354d7d371f875398ea888944fbf2fcc0631b6bf2e34fcb9783')

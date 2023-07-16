# Maintainer: realroot

pkgname=tinydm-dinit
pkgver=1.1.3
pkgrel=1
pkgdesc="dinit service scripts for tinydm"
arch=('any')
url="https://artixlinux.org"
license=('GPL-3')
groups=('dinit-world')
depends=('tinydm' 'init-logind')
provides=('init-tinydm' 'init-displaymanager')
conflicts=('init-tinydm' 'init-displaymanager')
source=("tinydm" "tinydm.script")

package() {
    install -Dm644 tinydm        "$pkgdir/etc/dinit.d/tinydm"
    install -Dm755 tinydm.script "$pkgdir/etc/dinit.d/scripts/tinydm"
}

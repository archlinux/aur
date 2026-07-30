# Maintainer: MISTER NEGATIVE <misternegative21@gmail.com>

pkgname=matsya-calamares-config
pkgver=2.0
pkgrel=1
pkgdesc="Calamares installer configuration and branding for MatsyaOS"
url="https://github.com/MatsyaOs/matsya-calameres-config"
arch=('any')
license=('GPL-2.0-only')
depends=('matsya-calamares')

prepare() {
    cp -af ../etc/. "${srcdir}"
}

package() {
    (find calamares -type f -exec install -Dm 644 "{}" "$pkgdir/etc/{}" \;)
    chmod 755 "$pkgdir"/etc/calamares/launch.sh
    chmod 755 "$pkgdir"/etc/calamares/branding/matsya/test-slides.sh
}




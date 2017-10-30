# Maintainer: Kenny Rasschaert <kenny@kennyrasschaert.com>
pkgname=goss-bin
pkgver=0.3.5
pkgrel=2
pkgdesc="Quick and Easy server testing/validation"
arch=('i686' 'x86_64' 'arm')
provides=('goss' 'dgoss')
url="https://goss.rocks"
license=('Apache')
source=("https://github.com/aelsabbahy/goss/releases/download/v${pkgver}/dgoss"
        "https://raw.githubusercontent.com/aelsabbahy/goss/v${pkgver}/LICENSE")
source_i686=("https://github.com/aelsabbahy/goss/releases/download/v${pkgver}/goss-linux-386")
source_x86_64=("https://github.com/aelsabbahy/goss/releases/download/v${pkgver}/goss-linux-amd64")
source_arm=("https://github.com/aelsabbahy/goss/releases/download/v${pkgver}/goss-linux-arm")
sha1sums_i686=('de49dc91ba5a228f5ed8c84e5c08b945b76fde7c')
sha1sums_x86_64=('171bdfcea883a58726e649162e5a99e0cd6cb7bc')
sha1sums_arm=('4da30446f164f8ec76d09e96a2d74c7ee6c5ca89')
sha1sums=('75ea0daa81f364e4aa7cce1387214ad2d0ded0fe'
          'SKIP')

package() {
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 0755 goss-linux-* "${pkgdir}/usr/bin/goss"
    install -Dm 0755 dgoss "${pkgdir}/usr/bin/dgoss"
}

# vim:set ts=2 sw=2 et:

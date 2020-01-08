# Maintainer: Kenny Rasschaert <kenny@kennyrasschaert.com>
pkgname=goss-bin
pkgver=0.3.9
pkgrel=2
pkgdesc="Quick and Easy server testing/validation"
arch=('i686' 'x86_64' 'arm')
provides=('goss' 'dgoss')
url="https://goss.rocks"
license=('Apache')
source=("dgoss-${pkgver}::https://github.com/aelsabbahy/goss/releases/download/v${pkgver}/dgoss"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/aelsabbahy/goss/v${pkgver}/LICENSE")
source_i686=("goss-linux-386-${pkgver}::https://github.com/aelsabbahy/goss/releases/download/v${pkgver}/goss-linux-386")
source_x86_64=("goss-linux-amd64-${pkgver}::https://github.com/aelsabbahy/goss/releases/download/v${pkgver}/goss-linux-amd64")
source_arm=("goss-linux-arm-${pkgver}::https://github.com/aelsabbahy/goss/releases/download/v${pkgver}/goss-linux-arm")
sha1sums=('4bcebbe977058deb961336b9cf9f37e4e6c18e2f'
          '669a1e53b9dd9df3474300d3d959bb85bad75945')
sha1sums_i686=('06450b3a33a89e950fce816ef464ff32926e3ef7')
sha1sums_x86_64=('12cfc119f4ad25f8abfaaab494bfbceb390f521c')
sha1sums_arm=('6971dd72a33d42adf9d43ba571d01e522217f89c')

package() {
    install -D -m644 LICENSE-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 0755 goss-linux-*-${pkgver} "${pkgdir}/usr/bin/goss"
    install -Dm 0755 dgoss-${pkgver} "${pkgdir}/usr/bin/dgoss"
}

# vim:set ts=2 sw=2 et:

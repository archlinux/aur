# Maintainer: Kenny Rasschaert <kenny@kennyrasschaert.com>
pkgname=goss-bin
pkgver=0.3.8
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
sha1sums=('5d564e9639eadf1aafbfd58255bd873371e2468e'
          '669a1e53b9dd9df3474300d3d959bb85bad75945')
sha1sums_i686=('3403b6be3ab6b991ee7dc0277ade6ed8b87bcee5')
sha1sums_x86_64=('dba8dd62559fb9d95f3e4c42ba40275166f35e9c')
sha1sums_arm=('e7222e7ec2a1cec005f18a3889fc11239f840209')

package() {
    install -D -m644 LICENSE-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 0755 goss-linux-*-${pkgver} "${pkgdir}/usr/bin/goss"
    install -Dm 0755 dgoss-${pkgver} "${pkgdir}/usr/bin/dgoss"
}

# vim:set ts=2 sw=2 et:

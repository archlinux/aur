# Maintainer: Kenny Rasschaert <kenny@kennyrasschaert.com>
pkgname=goss-bin
pkgver=0.3.6
pkgrel=1
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
sha1sums_i686=('29ed8add22c52295dee9b69e64e9c4cc1f0b0f45')
sha1sums_x86_64=('9c41486bc07e26eb4c9031302270fd72fa10961b')
sha1sums_arm=('f692aeae48d0a2a425cb30a99e693c1b9a0e1ead')
sha1sums=('2758d79df8d9325bfefdf816ae20a63ff67322f0'
          'SKIP')

package() {
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 0755 goss-linux-* "${pkgdir}/usr/bin/goss"
    install -Dm 0755 dgoss "${pkgdir}/usr/bin/dgoss"
}

# vim:set ts=2 sw=2 et:

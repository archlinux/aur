# Maintainer: Kenny Rasschaert <kenny@kennyrasschaert.com>
pkgname=goss-bin
pkgver=0.3.7
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
sha1sums=('c8846d680660b2e108c1aa4b575dca5a7bdeb65b'
          '669a1e53b9dd9df3474300d3d959bb85bad75945')
sha1sums_i686=('8d47d1d2a3900c866d8b7a2de016f353fd1e1ec9')
sha1sums_x86_64=('aa430743d916413ac1b84919df968f57dd7a9413')
sha1sums_arm=('f3ab80d88f1cf10d95fef759d7617c8bbc0726f0')

package() {
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 0755 goss-linux-* "${pkgdir}/usr/bin/goss"
    install -Dm 0755 dgoss "${pkgdir}/usr/bin/dgoss"
}

# vim:set ts=2 sw=2 et:

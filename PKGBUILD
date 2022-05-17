# Maintainer: Patrick M. <aur at patrickmang dot de>

pkgname=fuchsia-cursor
pkgver=1.0.5
pkgrel=2
pkgdesc="Open source port of FuchsiaOS's cursors for Linux"
arch=('any')
url='https://github.com/ful1e5/fuchsia-cursor'
license=('AGPL')
source=("Fuchsia-${pkgver}.tar.gz::https://github.com/ful1e5/${pkgname}/releases/download/v${pkgver}/Fuchsia.tar.gz"
        "Fuchsia-Pop-${pkgver}.tar.gz::https://github.com/ful1e5/${pkgname}/releases/download/v${pkgver}/Fuchsia-Pop.tar.gz"
        "Fuchsia-Red-${pkgver}.tar.gz::https://github.com/ful1e5/${pkgname}/releases/download/v${pkgver}/Fuchsia-Red.tar.gz")
sha256sums=('686c74f62b35b6bc6c955ffbede4e9dd190104c009d6a4ea6a0a2f8e1db9b642'
            '43fd9e83ae690a51722389ae9fb8c850eef48aa9026e5e1818f6b4c9b652a643'
            '7d088b2cfb529af204b8deed610b24c8a40af4ed26d3b6d6a9fa463385cec804')

package() {
  install -Ddm755 "${pkgdir}/usr/share/icons"
  cp -dr --no-preserve=ownership "Fuchsia" "${pkgdir}/usr/share/icons/"
  cp -dr --no-preserve=ownership "Fuchsia-Pop!" "${pkgdir}/usr/share/icons/"
  cp -dr --no-preserve=ownership "Fuchsia-Red" "${pkgdir}/usr/share/icons/"
}

# Maintainer: Patrick M. <aur at patrickmang dot de>

pkgname=fuchsia-cursor
pkgver=2.0.0
pkgrel=2
pkgdesc="Open source port of FuchsiaOS's cursors for Linux"
arch=('any')
url='https://github.com/ful1e5/fuchsia-cursor'
license=('AGPL')
source=("Fuchsia-${pkgver}.tar.gz::https://github.com/ful1e5/${pkgname}/releases/download/v${pkgver}/Fuchsia.tar.gz"
        "Fuchsia-Pop-${pkgver}.tar.gz::https://github.com/ful1e5/${pkgname}/releases/download/v${pkgver}/Fuchsia-Pop.tar.gz"
        "Fuchsia-Red-${pkgver}.tar.gz::https://github.com/ful1e5/${pkgname}/releases/download/v${pkgver}/Fuchsia-Red.tar.gz")
sha256sums=('22bf639e681736c55b8d2266fbcc70ad10d6d55d4456136c921f57c3a2132a4b'
            'b4dac495290146b0d9ed8cc782de1915c11b1887645358f12c196b03870f6265'
            'f365dacf16f6bd34d4313853789d0358cd574a1489041ab793cd4eff333551a0')

package() {
  install -Ddm755 "${pkgdir}/usr/share/icons"
  cp -dr --no-preserve=ownership "Fuchsia" "${pkgdir}/usr/share/icons/"
  cp -dr --no-preserve=ownership "Fuchsia-Pop" "${pkgdir}/usr/share/icons/"
  cp -dr --no-preserve=ownership "Fuchsia-Red" "${pkgdir}/usr/share/icons/"
}

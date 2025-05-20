# Maintainer: Zoe Wetzel <aur@commanderred.xyz>
pkgname=framework-fix-usb

pkgver=1.0.0
pkgrel=1
pkgdesc="A script for fixing the usb ports on framework laptops"

arch=('any')
license=('MIT')
url="https://github.com/CommanderRedYT/framework-fix-usb"

source=(
  ${pkgname}-${pkgver}-${pkgrel}.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz"
)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m 755 "./framework-fix-usb" "${pkgdir}/usr/bin/framework-fix-usb"
}

sha256sums=('e8f7a44e5715bdd114f00e41a24ce91cd084d83918840b6b975b0d60d2f1c760')

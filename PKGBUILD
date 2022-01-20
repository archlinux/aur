# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=avrisp-udev
pkgver=0.1
pkgrel=1
pkgdesc="udev rules for AVR ISP Atmel programmer"
arch=(any)
url="https://www.microchip.com/DevelopmentTools/ProductDetails/PartNO/ATAVRISP2"
license=(GPL)
depends=(systemd)
source=(99-avrispmkII.rules)
sha256sums=('21f0a7c2a6f01b47c95387bcef2cf29303772e41afbc732d9ea781b5173e071d')

package() {
  cd "${srcdir}"

  install -Dm644 "99-avrispmkII.rules" "${pkgdir}/etc/udev/rules.d/99-avrispmkII.rules"
}

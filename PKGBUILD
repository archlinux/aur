# Maintainer: Wereii <aur+me@wereii.cz>

pkgname=fractal-udev
pkgver=1.1.0
pkgrel=1
pkgdesc="Udev rules for Fractal devices (Adjust Pro Hub, Scape); Non-official, custom for Arch Linux"
arch=(any)
url="https://support.fractal-design.com"
license=(MIT)
depends=(udev)
source=(71-fractal.rules)
b2sums=(SKIP)

package() {
  install -Dm 644 71-fractal.rules -t "${pkgdir}"/usr/lib/udev/rules.d/
}

# vim: ts=2 sw=2 et:

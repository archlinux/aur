# Maintainer: Filippo Veneri <filippo[dot]veneri[at]gmail[dot]com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgname=acpilight
pkgver=1.0
pkgrel=2
pkgdesc="A backward-compatibile xbacklight replacement based on ACPI"
arch=('any')
url="https://github.com/wavexx/acpilight"
license=('GPL3')
depends=('python')
provides=('xorg-xbacklight')
conflicts=('xorg-xbacklight')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/wavexx/acpilight/archive/v${pkgver}.tar.gz)
sha512sums=('f7913f7ebf6cbde95a42165d8bfa237be03d90fc097164b971c92721cc76f1260a6a607d85f3ecb05ec482019f0ed7f0827a473608daf39b0d05b37c1d228a8a')

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/${pkgname}-${pkgver}/xbacklight" "${pkgdir}/usr/bin/xbacklight"
}

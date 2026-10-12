# Maintainer: Kai Rollmann <arithmeticarena@kairollmann.de>
pkgname=arithmetic-arena-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Mental arithmetic chains without the countdown: follow the steps, type the result, see how long it took afterwards"
arch=('x86_64')
url="https://kairollmann.de/arithmeticarena"
license=('LicenseRef-Proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
provides=('arithmetic-arena')
conflicts=('arithmetic-arena')
options=('!strip')
source=("https://kairollmann.de/arithmeticarena/releases/1.1.1/Arithmetic-Arena_1.1.1_amd64.tar.gz")
sha256sums=('2dd561d3a2e301e6509a52f78fec7f49bc53359b77a95a60156063660e2ab730')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
}

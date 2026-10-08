# Maintainer: Kai Rollmann <arithmeticarena@kairollmann.de>
pkgname=arithmetic-arena-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Mental arithmetic chains without the countdown: follow the steps, type the result, see how long it took afterwards"
arch=('x86_64')
url="https://kairollmann.de/arithmeticarena"
license=('LicenseRef-Proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
provides=('arithmetic-arena')
conflicts=('arithmetic-arena')
options=('!strip')
source=("https://kairollmann.de/arithmeticarena/releases/1.0.1/Arithmetic-Arena_1.0.1_amd64.tar.gz")
sha256sums=('8dcc55cb17f65d8401e9bb25be086a7f9d8ae6fb1c5737527589e9b4c080f5ff')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
}

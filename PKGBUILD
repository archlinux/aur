# Maintainer: Kai Rollmann <arithmeticarena@kairollmann.de>
pkgname=arithmetic-arena-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Mental arithmetic chains without the countdown: follow the steps, type the result, see how long it took afterwards"
arch=('x86_64')
url="https://kairollmann.de/arithmeticarena"
license=('LicenseRef-Proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
provides=('arithmetic-arena')
conflicts=('arithmetic-arena')
options=('!strip')
source=("https://kairollmann.de/arithmeticarena/releases/1.2.0/Arithmetic-Arena_1.2.0_amd64.tar.gz")
sha256sums=('d2b3ce288a0e207faa9f99a472d22f2477d46711e837fee27f0b56a839291004')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
}

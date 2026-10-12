# Maintainer: Kai Rollmann <arithmeticarena@kairollmann.de>
pkgname=arithmetic-arena-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Mental arithmetic chains without the countdown: follow the steps, type the result, see how long it took afterwards"
arch=('x86_64')
url="https://kairollmann.de/arithmeticarena"
license=('LicenseRef-Proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
provides=('arithmetic-arena')
conflicts=('arithmetic-arena')
options=('!strip')
source=("https://kairollmann.de/arithmeticarena/releases/1.1.0/Arithmetic-Arena_1.1.0_amd64.tar.gz")
sha256sums=('4f2c6abb10a27c14d554114da984e7a390f4347d3d598e51875c2c99aaa50b5f')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
}

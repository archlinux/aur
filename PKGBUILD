# Maintainer: Kai Rollmann <arithmeticarena@kairollmann.de>
pkgname=arithmetic-arena-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Mental arithmetic chains without the countdown: follow the steps, type the result, see how long it took afterwards"
arch=('x86_64')
url="https://kairollmann.de/arithmeticarena"
license=('LicenseRef-Proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
provides=('arithmetic-arena')
conflicts=('arithmetic-arena')
options=('!strip')
source=("https://kairollmann.de/arithmeticarena/releases/1.4.0/Arithmetic-Arena_1.4.0_amd64.tar.gz")
sha256sums=('b806624853190b6ae4eb550152946a4f6e38cbba2fd9cfcf6aa0624c97d4a3b8')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
}

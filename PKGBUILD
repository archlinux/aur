# Maintainer: Kai Rollmann <arithmeticarena@kairollmann.de>
pkgname=arithmetic-arena-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Mental arithmetic chains without the countdown: follow the steps, type the result, see how long it took afterwards"
arch=('x86_64')
url="https://kairollmann.de/arithmeticarena"
license=('LicenseRef-Proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
provides=('arithmetic-arena')
conflicts=('arithmetic-arena')
options=('!strip')
source=("https://kairollmann.de/arithmeticarena/releases/1.3.0/Arithmetic-Arena_1.3.0_amd64.tar.gz")
sha256sums=('665da36e9064739e1c304d5e6fae8abd365787fb79794b623ff56f502fa6c331')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
}

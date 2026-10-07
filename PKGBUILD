# Maintainer: Kai Rollmann <arithmeticarena@kairollmann.de>
pkgname=arithmetic-arena-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Mental arithmetic chains without the countdown: follow the steps, type the result, see how long it took afterwards"
arch=('x86_64')
url="https://kairollmann.de/arithmeticarena"
license=('LicenseRef-Proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
provides=('arithmetic-arena')
conflicts=('arithmetic-arena')
options=('!strip')
source=("https://kairollmann.de/arithmeticarena/releases/1.0.0/Arithmetic-Arena_1.0.0_amd64.tar.gz")
sha256sums=('7ebcd8e75c916b8884b4ceaf4ea0ae7b4f9e0dcdd278e7a49eb1793619463663')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
}

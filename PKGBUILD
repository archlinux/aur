# Maintainer: Kai Rollmann <bibabobilanz@kairollmann.de>
pkgname=bibabo-bilanz-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Buchhaltung für eine kleine GmbH: SKR04, Bilanz und GuV, ELSTER-Vorbereitung, Jahresabschluss"
arch=('x86_64')
url="https://kairollmann.de/bibabobilanz"
license=('LicenseRef-Proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
provides=('bibabo-bilanz')
conflicts=('bibabo-bilanz')
options=('!strip')
source=("https://kairollmann.de/bibabobilanz/releases/1.0.0/Bibabo-Bilanz_1.0.0_amd64.tar.gz")
sha256sums=('911e947038d79a20c85a10bde04fdeb770dc363c083d94c3c5b5df25bc02cdac')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
}

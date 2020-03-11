# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=faf-ice-adapter-java
pkgver=2.4.1
pkgrel=1
epoch=0
pkgdesc="A P2P connection proxy for Supreme Commander: Forged Alliance using ICE"
url="http://www.faforever.com/"
arch=('any')
license=('GPL3')
groups=()
#depends=('java-openjfx')
depends=('java8-openjfx')
#makedepends=('jdk-openjdk' 'gradle')
makedepends=('jdk8-openjdk' 'gradle')
checkdepends=()
optdepends=()
provides=('faf-ice-adapter')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/FAForever/java-ice-adapter/releases/download/v$pkgver/faf-ice-adapter.jar"  'faf-ice-adapter')
sha256sums=('cb8f078541fc99895fdfa00bd6ce723a77a3cf4c9946c8f6884d53b16f2a9711' '6b5e2809751a7bb230a2f338398178c53acbf8df884efc57717d9c4e1e842175')
noextract=()
validpgpkeys=()

package() {
  install -D "faf-ice-adapter.jar" "$pkgdir/usr/share/java/faf-ice-adapter/faf-ice-adapter.jar"
  install -D "$srcdir/faf-ice-adapter" "$pkgdir/usr/bin/faf-ice-adapter"
}

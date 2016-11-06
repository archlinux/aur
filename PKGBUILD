# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=faf-uid
pkgver=3.0.0
pkgrel=1
epoch=0
pkgdesc="Forged Alliance Forever - Anti-smurfing binary for the lobby client."
url="http://www.faforever.com/"
arch=('x86_64')
license=('GPL3')
groups=()
depends=('xorg-xrandr' 'util-linux' 'pciutils' 'coreutils')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/FAForever/uid/releases/download/v$pkgver/faf-uid")
sha256sums=('6222494c7e295b1a57d637247505ce1961a6ffa7ed84e3234c67a15bd33045c7')
noextract=()
validpgpkeys=()

prepare() {
  chmod +x "$srcdir/faf-uid"
}

#build() {
#}

package() {
  install -D "$srcdir/faf-uid" "$pkgdir/usr/bin/faf-uid"
}

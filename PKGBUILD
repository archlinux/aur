# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=faf-uid
pkgver=4.0.5
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
sha256sums=('492022a0abad7c5b805dfa2b77505e9f535c6664b19f3efbccc3fbae4281e6f5')
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

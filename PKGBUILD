# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=faf-ice-adapter
pkgver=5.4.2
pkgrel=1
epoch=0
pkgdesc="A P2P connection proxy for Supreme Commander: Forged Alliance using ICE"
url="http://www.faforever.com/"
arch=('x86_64')
license=('GPL3')
groups=()
depends=('nodejs')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/FAForever/ice-adapter/releases/download/v$pkgver/faf-ice-adapter-linux64-v$pkgver.tar.xz")
sha256sums=('099dc6da3bacef5c8dced5ec2a8bd2af28c936758fbe7d6bf413f466dfc2f682')
noextract=()
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/lib"
  cp -r "./faf-ice-adapter" "$pkgdir/usr/lib/faf-ice-adapter"
  mkdir -p "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin" && ln -s "../lib/faf-ice-adapter/faf-ice-adapter.js" "./faf-ice-adapter"
  chmod +x "./faf-ice-adapter"
}

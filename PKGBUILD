# Maintainer: Andrew Walls <andrew.walls2 (at) gmail.com>
pkgname=sconsify
pkgver=0.3.0_rc1
pkgrel=1
pkgdesc="CLI Spotify client"
arch=('x86_64')
url="www.sconsify.org"
license=('Apache')
depends=('portaudio' 'libspotify')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/fabiofalci/sconsify/releases/download/v${pkgver//_/-}/linux-$CARCH-$pkgname-${pkgver//_/-}.zip")
noextract=()
md5sums=('6eb8d70cc9a20653932395fb2816c90a')
validpgpkeys=()

package() {
    mkdir -p $pkgdir/usr/bin
    cp sconsify $pkgdir/usr/bin
}

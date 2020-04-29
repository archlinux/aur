# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Sergio Rosello <alcanalimail at gmail dot com>
pkgname=screen-desktop
pkgver=1.0.38
pkgrel=1
epoch=
pkgdesc="Work together like you’re in the same room. Fast screen sharing with multiplayer control, drawing & video."
arch=('x86_64')
url="https://screen.so/#/home"
license=('unknown')
groups=()
depends=()
makedepends=('libarchive')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://download.screen.so/desktop-app/linux/${pkgver}/${pkgname}-${pkgver}-${pkgrel}.x86_64.rpm")
noextract=()
md5sums=('35946616aada657b7f7102a4eba6f627')
validpgpkeys=()

package() {
    cd ${srcdir}/
    bsdtar -xf ${pkgname}-${pkgver}-${pkgrel}.x86_64.rpm -C ${pkgdir}
}

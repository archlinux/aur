# Maintainer: Jonas Schwartz
pkgname=galaxybudsclient-bin
_pkgname=GalaxyBudsClient
pkgver=4.4.1
pkgrel=3
pkgdesc="Galaxy Buds Client for Linux"
arch=('x86_64'
      'armv7h'
      'aarch64')
url="https://github.com/ThePBone/GalaxyBudsClient"
license=('GPL3')
depends=()
makedepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
options=("!strip")
source=("${pkgname}.desktop" "icon_white.png")
source_x86_64=("https://github.com/ThePBone/GalaxyBudsClient/releases/download/${pkgver}/${_pkgname}_Linux_64Bit_Portable.bin")
source_armv7h=("https://github.com/ThePBone/GalaxyBudsClient/releases/download/${pkgver}/${_pkgname}_Linux_arm_Portable.bin")
source_aarch64=("https://github.com/ThePBone/GalaxyBudsClient/releases/download/${pkgver}/${_pkgname}_Linux_arm64_Portable.bin")

package() {
	install -Dm755 ${_pkgname}_Linux_64Bit_Portable.bin "$pkgdir/usr/bin/galaxybudsclient"
	install -Dm644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/galaxybudsclient.desktop"
	install -Dm644 "$srcdir/icon_white.png" "$pkgdir/usr/share/pixmaps/galaxybudsclient.png"
}
sha256sums=('61e88374446b2d378e487f0b4cb41cafac7dfb6ce1905158028b144123c5c1ca'
            '04b551470a2e0ccd99b266d313265321113886f5808b872bf928a97442bf930a')
sha256sums_x86_64=('eef881b49f5bceea153870c7b82633e2a5eeec82ddc6949883a7c9ed3e074ae4')
sha256sums_armv7h=('aa17d71d9a539fdac508ce60d0ec8f078a7662d85c91f58ac3e4da31c3be8074')
sha256sums_aarch64=('892ca971816cf6cdcc0fc4d46004ad88fefa4cafd97b491e45aec79c43a81251')

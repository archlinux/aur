# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog-wpe-gl-armv7l
pkgver=0.8.0
arch=(armv7l armv7h)
pkgrel=1
url=https://github.com/Igalia/cog
license=(custom:MIT)
groups=(wpe)
provides=(cog cog-git)
conflicts=(cog cog-git)
depends=(wpewebkit-gl-armv7l wpebackend-fdo libinput)
source=('https://webreflection.github.io/aur/cog-wpe-gl-armv7l-0.8.0.tar.gz')
md5sums=('155ad64e25b9008893dc7f02dd4958a0')
sha1sums=('024049f1a4596ff127fa039b4d7554e6dcd1404d')
sha256sums=('e8efc0fab5909f04f4219b13c927a61b60d5202c5e03f52bc307d33fe70b6722')
sha512sums=('de5963e658eb235bb7ee99395867b17f83c9077c5b08629416dfc1e3070b76d1ff7607363b3dce1e078b1d7c9a1eaa09d42fd32dc5921f83fb194344e8a28d2e')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

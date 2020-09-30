# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog-wpe-gl-aarch64
pkgver=0.8.0
arch=(aarch64)
pkgrel=1
url=https://github.com/Igalia/cog
license=(custom:MIT)
groups=(wpe)
provides=(cog cog-git)
conflicts=(cog cog-git)
depends=(wpewebkit-gl-aarch64 wpebackend-fdo libinput)
source=('https://webreflection.github.io/aur/cog-wpe-gl-aarch64-0.8.0.tar.gz')
md5sums=('92ee2950dd7d436423f904e4ef0d106e')
sha1sums=('aceb711de1a974658f6226120d82c988d7fce04b')
sha256sums=('b03e78b79e8ff29d6710984ffc88c63787ce54b3568920e0ff93206bafad9eb4')
sha512sums=('98ea69d3fc130112ca5e520b186bbfde1091f1793c88930c2791fa4a072c192a97a30ab4dbf1310820666a371727ca61d8495a4d57b2e5e15077ef3d54d397c9')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

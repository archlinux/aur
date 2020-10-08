# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog-wpe-gl-x86_64
pkgver=0.8.0
arch=(armv7l armv7h)
pkgrel=1
url=https://github.com/Igalia/cog
license=(custom:MIT)
groups=(wpe)
provides=(cog cog-git)
conflicts=(cog cog-git)
depends=(wpewebkit-gl-x86_64 wpebackend-fdo libinput)
source=('https://webreflection.github.io/aur/cog-wpe-gl-x86_64-0.8.0.tar.gz')
md5sums=('933f3424bb4beef83d5cdf39a156330f')
sha1sums=('6ae671fa9a1e770c9c5cab760de0e76370f53aad')
sha256sums=('4991c9691da6f7c1158efc5c84f8e4ee12fabd151b9e5955a9fb461575262a27')
sha512sums=('7166a299d0954048afa70150a2a044bb38448711d288bd4b1b257aa6cda1ea46b039f856ce05240b36b5f396954c59eb793304e511518e1555d3aa23e8e36709')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog-wpe-gl-armv7l
pkgver=0.6.0
arch=(armv7l armv7h)
pkgrel=1
url=https://github.com/Igalia/cog
license=(custom:MIT)
groups=(wpe)
provides=(cog cog-git)
conflicts=(cog cog-git)
depends=(wpewebkit-gl-armv7l wpebackend-fdo libinput)
source=('https://webreflection.github.io/aur/cog-wpe-gl-armv7l-0.6.0.tar.gz')
md5sums=('9c33bcc44002793cf31406d42f484af8')
sha1sums=('41ace329c3a12ca7bbf211078af618ddcbbb319d')
sha256sums=('1ea3f08798918765e95c218a10b0de68234b15d1bcf926e0e0b357169b4303b7')
sha512sums=('71ae542759c1db1a273de553ef4ac89dec16e5829a6f3f851a0aa992d02844d7c9dab44e09b85f4bbe0ae12810ee3f859162f08ba121c5877b4935cbf5651e36')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

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
md5sums=('7d35005208ae0878d084458d2a0f094c')
sha1sums=('7c3c7d8ea8331374f9d7b3a39f6894c2d186e8d0')
sha256sums=('bffe07916ae23d26bed90effebd7bd57cdaed7d8170fb7e17a5eac4d6cf3e654')
sha512sums=('9c6c787603569f317c5859bfc5a05f6438db641dcb310a10e30f8dea0053d0513fd3ef8265fd7a366f3a16243f2ce44bb988dc0deb7a9c75a76b5b124590a6e8')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

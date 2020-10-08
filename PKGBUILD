# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog-wpe-bin-armv7l
pkgver=0.8.0
arch=(armv7l armv7h)
pkgrel=1
url=https://github.com/Igalia/cog
license=(custom:MIT)
groups=(wpe)
provides=(cog cog-git)
conflicts=(cog cog-git)
depends=(wpewebkit-bin-armv7l wpebackend-fdo libinput)
source=('https://webreflection.github.io/aur/cog-wpe-bin-armv7l-0.8.0.tar.gz')
md5sums=('94cf76a2740f098c845a76bf97c804b6')
sha1sums=('249def2e3fffd9d4f96a5708722c90b9ff4a4842')
sha256sums=('af5f3511da67bebd224034fc1e2f9e2ffedfa2096c131ddc85652c7e258c333f')
sha512sums=('524becc62fce4d4280f5ce68f77a83a0bb534b7e04014c77d1244ba07facf2f7dbc0b8d7c81d89fc19e402d905b695a371dfcf16af905446db9595e30f78c705')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

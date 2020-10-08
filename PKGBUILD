# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog-wpe-bin-aarch64
pkgver=0.8.0
arch=(aarch64)
pkgrel=1
url=https://github.com/Igalia/cog
license=(custom:MIT)
groups=(wpe)
provides=(cog cog-git)
conflicts=(cog cog-git)
depends=(wpewebkit-bin-aarch64 wpebackend-fdo libinput)
source=('https://webreflection.github.io/aur/cog-wpe-bin-aarch64-0.8.0.tar.gz')
md5sums=('20d0e22d26569c8ec9488a28a35dcd34')
sha1sums=('932d643a223a5c365699cbea467dcdeddc4f289d')
sha256sums=('e4fbd01be7b57c953e4e2ed81edd4f2bec7061890af30e839b751871af76430f')
sha512sums=('a24ada9df4d2d143d299283c8afd04586c5d42cefd89ce1464c2dfec946033bd9058ac84800251ba576a2d7d198bbd37cc69dff678ffef4f39af8b42f4de9144')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

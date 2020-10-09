# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog-wpe-bin
pkgver=0.8.0
arch=(aarch64 armv7h armv7l x86_64)
pkgrel=1
url=https://github.com/Igalia/cog
license=(custom:MIT)
groups=(wpe)
provides=(cog cog-git)
conflicts=(cog cog-git)
depends=(wpewebkit-bin wpebackend-fdo libinput)
source_aarch64=("${pkgname}-aarch64::https://webreflection.github.io/aur/${pkgname}-aarch64-${pkgver}.tar.gz")
source_armv7h=("${pkgname}-armv7h::https://webreflection.github.io/aur/${pkgname}-armv7l-${pkgver}.tar.gz")
source_armv7l=("${pkgname}-armv7l::https://webreflection.github.io/aur/${pkgname}-armv7l-${pkgver}.tar.gz")
source_x86_64=("${pkgname}-x86::https://webreflection.github.io/aur/${pkgname}-x86_64-${pkgver}.tar.gz")
sha256sums_aarch64=('e4fbd01be7b57c953e4e2ed81edd4f2bec7061890af30e839b751871af76430f')
sha256sums_armv7h=('af5f3511da67bebd224034fc1e2f9e2ffedfa2096c131ddc85652c7e258c333f')
sha256sums_armv7l=('af5f3511da67bebd224034fc1e2f9e2ffedfa2096c131ddc85652c7e258c333f')
sha256sums_x86_64=('2ceb11ed2633d5b2255856d04440b5273fe44e6862ced7b169c239d8cf6e8afa')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

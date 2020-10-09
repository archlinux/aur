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
source_aarch64=('cog-wpe-bin-aarch64::https://webreflection.github.io/aur/cog-wpe-bin-aarch64-0.8.0.tar.gz')
source_armv7h=('cog-wpe-bin-armv7h::https://webreflection.github.io/aur/cog-wpe-bin-armv7l-0.8.0.tar.gz')
source_armv7l=('cog-wpe-bin-armv7l::https://webreflection.github.io/aur/cog-wpe-bin-armv7l-0.8.0.tar.gz')
source_x86_64=('cog-wpe-bin-x86::https://webreflection.github.io/aur/cog-wpe-bin-x86_64-0.8.0.tar.gz')

sha256sums_aarch64=('e4fbd01be7b57c953e4e2ed81edd4f2bec7061890af30e839b751871af76430f')
sha256sums_armv7l=('af5f3511da67bebd224034fc1e2f9e2ffedfa2096c131ddc85652c7e258c333f')
sha256sums_armv7h=('af5f3511da67bebd224034fc1e2f9e2ffedfa2096c131ddc85652c7e258c333f')
sha256sums_x86_64=('b799849f5e80f9758fd17f8fc7fc896d2e33bd2a546254a45323977495914937')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}


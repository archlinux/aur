# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog-wpe-bin
pkgver=0.8.1
arch=(aarch64 armv7h armv7l x86_64)
pkgrel=1
url=https://github.com/Igalia/cog
license=(custom:MIT)
groups=(wpe)
provides=(cog cog-git)
conflicts=(cog cog-git)
depends=(wpewebkit-bin wpebackend-fdo libinput)
source_aarch64=('cog-wpe-bin-aarch64::https://webreflection.github.io/aur/cog-wpe-bin-aarch64-0.8.1.tar.gz')
source_armv7h=('cog-wpe-bin-armv7h::https://webreflection.github.io/aur/cog-wpe-bin-armv7l-0.8.1.tar.gz')
source_armv7l=('cog-wpe-bin-armv7l::https://webreflection.github.io/aur/cog-wpe-bin-armv7l-0.8.1.tar.gz')
source_x86_64=('cog-wpe-bin-x86::https://webreflection.github.io/aur/cog-wpe-bin-x86_64-0.8.1.tar.gz')

sha256sums_aarch64=('c26675f16560461bc768be43f867a6ed047518d48bdd551855b5bc454e085ff2')
sha256sums_armv7l=('45ab24467e2c766ca526ef11a0062ad09264a02d30a5cbca0d45ec7997e1c0c5')
sha256sums_armv7h=('45ab24467e2c766ca526ef11a0062ad09264a02d30a5cbca0d45ec7997e1c0c5')
sha256sums_x86_64=('d809d2375a52977e89c4212b90cd8069d668fea99c6d188fe620a098c5b4e201')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}


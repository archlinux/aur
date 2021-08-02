# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog-wpe-bin
pkgver=0.10.0
arch=(aarch64 armv7h armv7l x86_64)
pkgrel=1
url=https://github.com/Igalia/cog
license=(custom:MIT)
groups=(wpe)
provides=(cog cog-git)
conflicts=(cog cog-git)
depends=(wpewebkit-bin wpebackend-fdo libinput)
source_aarch64=('cog-wpe-bin-aarch64::https://webreflection.github.io/aur/cog-wpe-bin-aarch64-0.10.0.tar.gz')
source_armv7h=('cog-wpe-bin-armv7h::https://webreflection.github.io/aur/cog-wpe-bin-armv7l-0.10.0.tar.gz')
source_armv7l=('cog-wpe-bin-armv7l::https://webreflection.github.io/aur/cog-wpe-bin-armv7l-0.10.0.tar.gz')
source_x86_64=('cog-wpe-bin-x86::https://webreflection.github.io/aur/cog-wpe-bin-x86_64-0.10.0.tar.gz')

sha256sums_aarch64=('0839b55b874ab114e3c043637730ca0633156d5416c4bf418094652ede838c38')
sha256sums_armv7l=('061027a5eff1588a004f9d0a6a263f70ca63346da47d3998224d5315533d2eaf')
sha256sums_armv7h=('061027a5eff1588a004f9d0a6a263f70ca63346da47d3998224d5315533d2eaf')
sha256sums_x86_64=('9cc49107d0e4545775697af35fa8717b52bb7929b0383940c9bb84810d87a9ad')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}


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
md5sums=('193e60b8ae0598292c9e45fd89050d97')
sha1sums=('ad5c3580ef2b2a228811fb65d021b47a521da4ad')
sha256sums=('64ad44b3eaf6e6c8f8c92c94a75915dee1d6e21acb3d3a6898d4fcfd6f155140')
sha512sums=('e5074e23cf2f086dbb30e248cc8d6f86ddbea763e1d329f6f1e75831c30c4f5829f82860e815793427dc68825b1e5252e480c472555d71bdd990ce0f2636092e')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

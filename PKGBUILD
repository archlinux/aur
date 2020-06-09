# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog-wpe-gl-aarch64
pkgver=0.6.0
arch=(aarch64)
pkgrel=1
url=https://github.com/Igalia/cog
license=(custom:MIT)
groups=(wpe)
provides=(cog cog-git)
conflicts=(cog cog-git)
depends=(wpewebkit-gl-aarch64 wpebackend-fdo libinput)
source=('https://webreflection.github.io/aur/cog-wpe-gl-aarch64-0.6.0.tar.gz')
md5sums=('fe8feb0d19b2a6b6c2915d531ac85fc9')
sha1sums=('111a974ff00553ca9454dc0e7d09b473323753bc')
sha256sums=('7a8331f6eafaf0ca941da365b5a005fec406a1d38cbfecf4f5be6d3a3b5bada6')
sha512sums=('cee75133eae079c427c6a5ab1e0555a7c28fb3384421afe3d106832b3c1f383174365ee5de26074d5a4e2af1050c6e28cb3aec28353e6896a1021f66a9674abb')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

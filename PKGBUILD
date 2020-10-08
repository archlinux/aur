# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog-wpe-gl-x86_64
pkgver=0.8.0
arch=(x86_64)
pkgrel=1
url=https://github.com/Igalia/cog
license=(custom:MIT)
groups=(wpe)
provides=(cog cog-git)
conflicts=(cog cog-git)
depends=(wpewebkit-gl-x86_64 wpebackend-fdo libinput)
source=('https://webreflection.github.io/aur/cog-wpe-gl-x86_64-0.8.0.tar.gz')
md5sums=('2af92330c657ce4c360b28885aa90ea0')
sha1sums=('ef6013b93d436ba6b72b4b85235a97815a6401e3')
sha256sums=('0cc1e68b5837a990878e8442bf8f2120aa7955efc7ea42fc9fcec872e314ca62')
sha512sums=('127e1d6ca8524bd9776233bafebe67e77166abcb77e2f97e44aa87746e162fdcd6b9bd660d2733b78945b713de3dad7dd9e7ec5af436d0bbae0227b6a0c4fb25')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

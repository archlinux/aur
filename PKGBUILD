# Maintainer: toazd <wmcdannell@gmail.com>
pkgname=selah-bin
_pkgname=selah
pkgver=0.7.16
pkgrel=1
pkgdesc="A cross-platform Bible study app using Flutter and the 1769 King James Version"
arch=('x86_64')
url="https://github.com/toazd/selah"
license=('Unlicense')
depends=('gtk3' 'glib2' 'gcc-libs' 'glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${pkgname}-${pkgver}.deb::https://github.com/toazd/selah/releases/download/v0.7.16-build.141/selah_0.7.16_amd64.deb")
sha256sums=('af97323e5742712a8738b7922e5de8bdd27d2964e60b0f6661110480769e73e4')

package() {
    cd "$pkgdir"
    ar p "${srcdir}/${pkgname}-${pkgver}.deb" data.tar.gz | bsdtar -xzf -
}

# Maintainer: toazd <wmcdannell@gmail.com>
pkgname=selah-bin
_pkgname=selah
pkgver=0.7.19
pkgrel=4
pkgdesc="A cross-platform Bible study app using Flutter and the 1769 King James Version"
arch=('x86_64')
url="https://github.com/toazd/selah"
license=('Unlicense')
depends=('gtk3' 'glib2' 'gcc-libs' 'glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${pkgname}-${pkgver}-${pkgrel}.deb::https://github.com/toazd/selah/releases/download/v0.7.19-build.149/selah_0.7.19_amd64.deb")
sha256sums=('da6167f9fced8bc4e4b3e9ad678f17ee948586bf72c7e8e986f1fd0a1291f5b0')

package() {
    cd "$pkgdir"
    ar p "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.deb" data.tar.gz | bsdtar -xzf -
}

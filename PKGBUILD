# Maintainer: toazd <wmcdannell@gmail.com>
pkgname=selah-bin
_pkgname=selah
pkgver=0.8.9
pkgrel=3
pkgdesc="A cross-platform Bible study app using Flutter and the 1769 King James Version"
arch=('x86_64')
url="https://github.com/toazd/selah"
license=('Unlicense')
depends=('gtk3' 'glib2' 'gcc-libs' 'glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${pkgname}-${pkgver}-${pkgrel}.deb::https://github.com/toazd/selah/releases/download/v0.8.9-build.181/selah_0.8.9_amd64.deb")
sha256sums=('0234d35400e712360a8e8d21f82dad131d8882b74be3756093156ff3edef02b6')

package() {
    cd "$pkgdir"
    ar p "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.deb" data.tar.gz | bsdtar -xzf -
}

# Maintainer: toazd <wmcdannell@gmail.com>
pkgname=selah-bin
_pkgname=selah
pkgver=1.1.4
pkgrel=2
pkgdesc="A cross-platform Bible study app using Flutter and the 1769 King James Version"
arch=('x86_64')
url="https://github.com/toazd/selah"
license=('Unlicense')
depends=('gtk3' 'glib2' 'gcc-libs' 'glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${pkgname}-${pkgver}-${pkgrel}.deb::https://github.com/toazd/selah/releases/download/v1.1.4-build.226/selah_1.1.4_amd64.deb")
sha256sums=('332b0a1bd0d55876fc001de7405427d92bf542b310438d92d8c6160f16d20e8e')

package() {
    cd "$pkgdir"
    ar p "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.deb" data.tar.gz | bsdtar -xzf -
}
